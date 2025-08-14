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
            <a class="text-xl font-bold" href="/">{DOMAIN_NAME}</a>
            <nav class="space-x-4">
                <a href="/" class="hover:underline">Home</a>
                <a href="/about" class="hover:underline">Portfolio</a>
            </nav>
        </div>
    </header>

    <main class="flex-1 flex-grow">
	    <slot />
    </main>

    <footer class="border border-gray-300 p-4 text-center ">
	    <p>© 2025 {DOMAIN_NAME}</p>
    </footer>

</div>