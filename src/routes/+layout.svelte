<!-- src/routes/+layout.svelte -->
<script lang="ts">
	import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
    import { DOMAIN_NAME } from '../constants';

</script>

<svelte:head>
	<title>{DOMAIN_NAME}</title>
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="min-h-screen flex flex-col bg-gray-200 text-gray-800 jetbrains-mono-global">

    <header class="w-full border-b border-gray-300 p-4">
        <div class="mx-auto max-w-7xl flex justify-between items-center px-4 sm:px-6 lg:px-8">
            <h1 class="text-xl font-bold">{DOMAIN_NAME}</h1>
            <nav class="space-x-4">
                <a href="/" class="hover:underline">Inicio</a>
                <a href="/acerca" class="hover:underline">Acerca</a>
            </nav>
        </div>
    </header>

    <main class="flex-1 ">
	    <slot />
    </main>

    <footer class="border border-gray-300 p-4 text-center ">
	    <p>© 2025 {DOMAIN_NAME}</p>
    </footer>

</div>