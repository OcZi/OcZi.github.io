<script lang="ts">
    import me from "$lib/assets/github.jpg"
    import { onMount } from "svelte";
    import SimpleIconsGooglehome from '~icons/simple-icons/googlehome';
    import SimpleIconsLinkedin from '~icons/simple-icons/linkedin';
    import SimpleIconsYoutubemusic from '~icons/simple-icons/youtubemusic';
    import SimpleIconsHaskell from '~icons/simple-icons/haskell';
    import Github from "~icons/simple-icons/github"
    import moment from "moment"
    import { ACCOUNT_NAME, LINKEDIN_NAME, SALVA_BIRTH } from "../../constants";

    function calculateAge(dateOfBirth: any): number {
        return moment().diff(dateOfBirth, 'years');
    }


</script>

<div class="min-h-screen w-full flex items-center justify-center px-4">
  <div class="w-full max-w-6xl flex flex-col items-center sec-spacing text-left">

    <div class="w-full flex flex-col lg:flex-row items-center justify-center gap-12 ">
      <div class="max-w-2xl w-full text-left ">
        <h1 class="title leading-snug">
            <span class="important-text">Salvador Donayre</span>
            <br/>
            <span class="important-text">Epifanía</span>
        </h1>
        <div class="mt-5">
          <a
            href={`https://www.github.com/${ACCOUNT_NAME}`}
            target="_blank"
            >
            <Github class="relevant-icon hover:text-gray-500"/>
          </a>
          <a
            href={`https://www.linkedin.com/in/${LINKEDIN_NAME}`}
            target="_blank"
            >
          <SimpleIconsLinkedin class="relevant-icon hover:text-blue-600 "/>
          </a>
        </div>
        <div class="mt-8">
          <h1 class="less-text mt-2">
            <SimpleIconsGooglehome class="less-icon"/> Software Enthusiast
          </h1>

          <h1 class="less-text mt-2">
            <SimpleIconsYoutubemusic class="less-icon"/> Favourite genre: Synthwave, Latin Rock, etc
          </h1>
          <h1 class="less-text mt-2">
            <SimpleIconsHaskell class="less-icon"/> Currently learning: Haskell
          </h1>
        </div>
      </div>
      <img 
        src={me} 
        alt="Foto de perfil" 
        class="w-64 h-64 rounded-xl shadow-sm object-cover"
      />
    </div>
    <div class="w-full mt-10 border-b-2 "></div>

    <!-- Section 2: About -->
    <div class="w-full text-left sec-spacing">
      <h1 class="title">About me:</h1>
      <h2 class="relevant-text">
          I'm a {calculateAge(SALVA_BIRTH)}-year-old Developer from Perú, Latin America
          <br/>A
      </h2>

      <h1 class="title sec-spacing">Interests:</h1>
      <ol class="ml-4 mt-2 list-disc">
        <li>Game Development: Godot, Raylib, Unity and more!</li>
        <li>Web Development: For backend (NestJS, Spring Boot) and Frontend (SvelteJS, VueJS, React)!</li>
        <li>Functional Programming: hehe</li>
      </ol>
    </div>
  </div>
</div>
