<script lang="ts">
	export let data: { counter: number };
</script>

<svelte:head>
	<title>Page {data.counter}</title>
</svelte:head>

<slot />