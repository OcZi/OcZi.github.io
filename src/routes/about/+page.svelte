<script lang="ts">
  import me from "$lib/assets/github.jpg"
  import SimpleIconsSvelte from "~icons/simple-icons/svelte"
  import SimpleIconsLinkedin from "~icons/simple-icons/linkedin"
  import SimpleIconsYoutubemusic from "~icons/simple-icons/youtubemusic"
  import SimpleIconsHaskell from "~icons/simple-icons/haskell"
  import SimpleIconsGodot from "~icons/simple-icons/godotengine"
  import SimpleIconsCPP from "~icons/simple-icons/cplusplus"
  import SimpleIconsUnity from "~icons/simple-icons/unity"
  import SimpleIconsRaylib from "~icons/simple-icons/raylib"
  import SimpleIconsReact from "~icons/simple-icons/react"
  import SimpleIconsSpring from "~icons/simple-icons/spring"
  import SimpleIconsNestjs from "~icons/simple-icons/nestjs"
  import SimpleIconsAWS from "~icons/simple-icons/amazon"
  import SimpleIconsPostgresql from "~icons/simple-icons/postgresql"
  import Github from "~icons/simple-icons/github"
  import moment from "moment"
  import { ACCOUNT_NAME, LINKEDIN_NAME, SALVA_BIRTH } from "../../constants"
  import Typed from "$components/typed.svelte"

  function calculateAge(dateOfBirth: any): number {
    return moment().diff(dateOfBirth, "years")
  }
</script>

<style>
  @keyframes gradientText {
    0% {
      background-position: 200% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }

  .animate-peru:hover {
    background: linear-gradient(
      45deg,
      black,
      red,
      red,
      black
    );
    background-clip: text;
    background-size: 200% auto;
    color: transparent;
    cursor: pointer;
    animation: gradientText 2s linear infinite;
  }

  .animate-java {
    background: linear-gradient(
      45deg,
      black,
      #ED8B00,
      black
    );
    background-clip: text;
    background-size: 200% auto;
    color: transparent;
    cursor: pointer;
    animation: gradientText 2s linear infinite;
  }
</style>

<div class="min-h-screen w-full flex items-center justify-center px-4">
  <div class="w-full max-w-6xl flex flex-col items-center sec-spacing text-left">
    <div class="w-full flex flex-col lg:flex-row items-center justify-center gap-12">
      <div class="max-w-2xl w-full text-left">
        <Typed
          class="h-25 overflow-hidden"
          text="Salvador Donayre\nEpifanía"
          min={80}
          max={200}
          start={10}
          end={10}
          className="title leading-snug font-semibold important-text"
          hiddenClass="text-transparent"
        />

        <div class="mt-5">
          <a href={`https://www.github.com/${ACCOUNT_NAME}`} target="_blank">
            <Github class="relevant-icon hover:text-gray-500" />
          </a>
          <a href={`https://www.linkedin.com/in/${LINKEDIN_NAME}`} target="_blank">
            <SimpleIconsLinkedin class="relevant-icon hover:text-blue-600" />
          </a>
        </div>

        <div class="mt-8">
          <h1 class="less-text mt-2">
            <SimpleIconsCPP class="less-icon" /> Favourite Languages: Golang, C++, Java, Julia, Python ...
          </h1>
          <h1 class="less-text mt-2">
            <SimpleIconsYoutubemusic class="less-icon" /> My music genres: Latin Rock, French House, Electro-pop ...
          </h1>
          <h1 class="less-text mt-2">
            <SimpleIconsHaskell class="less-icon" /> Wanting to learn: Haskell
          </h1>
        </div>
      </div>

      <img
        src={me}
        alt="Foto de perfil"
        class="w-64 h-64 rounded-xl shadow-sm object-cover"
      />
    </div>

    <div class="w-full mt-10 border-b-2"></div>

    <div class="w-full text-left sec-spacing">
      <h1 class="title">About me:</h1>
      <h2 class="relevant-text">
        I'm a {calculateAge(SALVA_BIRTH)}-year-old Developer from
        <span class="font-semibold bg-gradient-to-r animate-peru bg-clip-text">Perú</span>,
        Latin America.
        <br />
        I started my programming odyssey since high school with
        <span class="font-semibold animate-java">Java</span>
        for the video game Minecraft (server-side). Since then, I haven't stopped developing all kinds of software as a hobby!
        <br /><br />Currently (2025) I'm studying Computer Science at University of Engineering and Technology (UTEC in Perú) 📚
      </h2>

      <h1 class="title sec-spacing">Motivation & interests:</h1>
      <h2 class="relevant-text">
        My fascination with pursuing general programming and software development is about its potential in the technological advancement of the world, where it works as an application of all kinds of branches of science (Mathematics, Chemistry, Biology, etc.), for its automation and easy use, being capable of having uses in everyday life.
        <br /><br />
      </h2>

      <h1 class="title sec-spacing">Skills:</h1>
      <ol class="ml-4 mt-2 list-disc space-y-4">
        <li>
          <div class="flex items-center gap-2 font-semibold">
            <SimpleIconsSvelte class="w-5 h-5  just-icon hover:text-orange-400 transition-colors duration-200" />
            Software Development
          </div>
          <ul class="ml-6 mt-1 list-none space-y-1">
            <li class="flex items-center gap-2">
              <SimpleIconsReact class="w-4 h-4 just-icon hover:text-blue-400" /> Frontend: Primarily with React, Svelte and a bit of VueJS
            </li>
            <li class="flex items-center gap-2">
              <SimpleIconsSpring class="w-4 h-4 just-icon hover:text-green-500" /> Backend: Spring Boot, NestJS, FastAPI, etc.
            </li>
            <li class="flex items-center gap-2">
              <SimpleIconsAWS class="w-4 h-4 just-icon hover:text-orange-400"/> AWS Cloud: Server management with AWS EC2, RDS, ECS, Serverless with AWS Lambda, etc.
            </li>
            <li class="flex items-center gap-2">
              <SimpleIconsPostgresql class="w-4 h-4 just-icon hover:text-blue-400" /> Database: Primarily PostgreSQL, MySQL, H2, SQLite and non-relational MongoDB, Redis, DynamoDB
            </li>
          </ul>
        <li>
          <div class="flex items-center gap-2 font-semibold">
            <SimpleIconsGodot class="w-5 h-5 just-icon hover:text-[#478CBF]" />
            Game Development
          </div>
          <ul class="ml-6 mt-1 list-none space-y-1">
            <li class="flex items-center gap-2">
              <SimpleIconsGodot class="w-4 h-4 just-icon hover:text-[#478CBF]" /> Godot: 2D & 3D tooling for indie games (mostly in GameJams)
            </li>
            <li class="flex items-center gap-2">
              <SimpleIconsUnity class="w-4 h-4 just-icon hover:text-gray-600" /> Unity: A bit of 2D top-view and general tooling
            </li>
            <li class="flex items-center gap-2">
              <SimpleIconsRaylib class="w-4 h-4 just-icon hover:text-gray-600" /> Raylib: General implementation for graphics, data structure visualization and more
            </li>
          </ul>
        </li>
      </ol>

      <div class="w-full mt-10"></div>
    </div>
  </div>
</div>
