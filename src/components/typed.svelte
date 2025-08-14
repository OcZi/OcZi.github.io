
<script lang="ts">
    import { onMount } from "svelte";

    // Constants
    const WAITING_TIMEOUT = 200;

    // Component attributes
    export let text: string = "";
    export let as: string = "h1";
    export let className: string = "";
    export let hiddenClass: string = "";
    export let min: number = 300;
    export let max: number = 100;

    export let start: number = 10;
    export let end: number = 10;

    let time = 0;

    const randomInt = () => {
        return Math.floor(Math.random() * (max - min) + min);
    }

    /**
     * Format an entire text to spans char by char with visibility by time.
     * It creates spans even if is not visible, to reserve space.
     * Supports newline to generate span blocks.
     * @param show
     * @param raw
     */
    const formatter = (show: number, raw: string) => {
        let html = ``;
        let command = false;
        for (let i = 0; i < raw.length; ++i) {
            const c = text.charAt(i);

            // newline parser
            if (command) {

                if (c == "n") {
                    html += `<span class="block"></span>`
                }
                command = false;
                continue;
            }

            // detecting special character (like \n)
            if (c == `\\`) {
                command = true;
                continue;
            }

            if (i < show) {
                html += `<span class="${className}">${c}</span>`;
            } else {
                html += `<span class="${hiddenClass}">${c}</span>`;
            }

            if (i == show - 1 && show != raw.length) {
                html += `<span class="${className}">_</span>`;
            } else if (show == 0 && i == 0) {
                html += `<span class="${className}">${waitingType(time)}</span>`
            }
        }
        return html;
    }

    const waitingType = (t: number) => {
        return t % 2 ? "_" : " ";
    }

    let typedHtml = formatter(0, text);

    const typeStart = () => {
        if (text.length == 0) {
            return;
        }

        if (time == start) {
            time = 0;
            typing();
            return;
        }

        typedHtml = formatter(0, text);
        ++time;
        setTimeout(typeStart, WAITING_TIMEOUT);
    };

    const typing = () => { 
        if (time <= text.length) {
            typedHtml = formatter(time, text);
            ++time;
            setTimeout(typing, randomInt());
        } else {
            time = 0;
            typeEnd(typedHtml);
        }
    };

    // Mutates completed html with "_" at the end.
    // It returns the original html when it finish.
    const typeEnd = (orgHtml: string) => {
        if (time == end) {
            typedHtml = orgHtml;
            return;
        }

        typedHtml = orgHtml + `<span class="${className}">${waitingType(time)}</span>`;
        ++time;
        setTimeout(() => typeEnd(orgHtml), WAITING_TIMEOUT);
    };

    onMount(() => {
        typeStart();
    });
</script>

<div {... $$props}>
    <div class="flex">
        <h1 class={"mr-4 " + className}>></h1>
        <svelte:element this={as}>
            {@html typedHtml}
        </svelte:element>
    </div>
</div>