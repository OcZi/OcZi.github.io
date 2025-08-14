<script lang="ts">
    import { page } from '$app/state'; 
</script>

<style>
    .title-text {
        font-size: 6rem;
    }

    .subtitle-text {
        font-size: 3rem;
    }
</style>

<div class="flex items-center justify-center flex-col h-screen">
    <h1 class="title-text">404</h1>
    <h2 class="subtitle-text"> {page.url.pathname}/ not found :p</h2>
</div>