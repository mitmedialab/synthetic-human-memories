<script lang="ts">
	let i = 0;
	export let t: 'og' | 'ai' | 'ogv' | 'aiv';

	const og = [
		'og/dl8',
		'og/dl4',
		'og/dl1',
		'og/dl6',
		'og/dl5',
		'og/ns7',
		'og/dc4',
		'og/ns4',
		'og/dc3',
		'og/ns1',
		'og/dc8',
		'og/dc5',
		'og/dl3',
		'og/dc1',
		'og/ns5',
		'og/ns3',
		'og/dc2',
		'og/ns2',
		'og/dc6',
		'og/dc7',
		'og/ns8',
		'og/dl2',
		'og/dl7',
		'og/ns6'
	];

	const ai = [
		'og/dl8',
		'ai/dl4-ai',
		'ai/dl1-ai',
		'og/dl6',
		'og/dl5',
		'og/ns7',
		'ai/dc4-ai',
		'ai/ns4-ai',
		'ai/dc3-ai',
		'ai/ns1-ai',
		'og/dc8',
		'og/dc5',
		'ai/dl3-ai',
		'ai/dc1-ai',
		'og/ns5',
		'ai/ns3-ai',
		'ai/dc2-ai',
		'ai/ns2-ai',
		'og/dc6',
		'og/dc7',
		'og/ns8',
		'ai/dl2-ai',
		'og/dl7',
		'og/ns6'
	];

	const imgs: { og: string[]; ai: string[]; ogv: string[]; aiv: string[] } = {
		og: og.map((x) => x + '.jpg'),
		ai: ai.map((x) => x + '.jpg'),
		ogv: og.map((x) => x + '.webm'),
		aiv: ai.map((x) => x + '.webm')
	};

	$: i &&
		(() => {
			const videoEl = document.querySelector('video');
			// check if video is loaded after 1 sec
			const reloadVideo = () =>
				videoEl &&
				setTimeout(() => {
					console.log('trigger');
					videoEl.load();
					videoEl.play();
				}, 100);
			if (!videoEl) reloadVideo();
		})();
</script>

<svelte:head>
	{#if ['og', 'ogv'].includes(t)}
		{#each [...imgs.og] as image}
			<link rel="preload" as="image" href={`imgs/${image}`} />
		{/each}
	{:else}
		{#each [...imgs.ai] as image}
			<link rel="preload" as="image" href={`imgs/${image}`} />
		{/each}
		<!-- {#each [...imgs.ogv, ...imgs.aiv] as image}
			<link rel="preload" type="video/webm" as="video" href={`vids/${image}`} />
		{/each} -->
	{/if}
</svelte:head>

<div class="flex h-screen w-screen flex-col items-center justify-center gap-2 overflow-hidden px-3">
	<div class="flex items-center justify-center gap-4 text-3xl">
		<button class="btn" on:click={() => (i > 0 ? i-- : i)}>←</button>
		<div class="aspect-square w-[40vw] max-w-md overflow-hidden bg-transparent">
			{#if ['og', 'ai'].includes(t)}
				<img src={`imgs/${imgs[t][i]}`} class="h-full w-full object-cover" alt="" />
			{:else}
				<!-- svelte-ignore a11y-media-has-caption -->
				{#key i}
					<video
						playsinline
						autoplay
						muted
						loop
						class="w-[40vw]"
						poster={`imgs/${imgs[t === 'ogv' ? 'og' : 'ai'][i]}`}
					>
						<source src={`vids/${imgs[t][i]}`} type="video/webm" /></video
					>
					<div class="h-0 w-0">
						{#if i < imgs[t].length - 2}
							<video preload="auto" class="w-[40vw]">
								<source src={`vids/${imgs[t][i + 1]}`} type="video/webm" /></video
							>
							<video preload="auto" class="w-[40vw]">
								<source src={`vids/${imgs[t][i + 2]}`} type="video/webm" /></video
							>
						{/if}
					</div>
				{/key}
				<!-- <div class="grid grid-cols-12">
					{#each imgs[t] as v}
						<video src={`vids/${v}`} class="w-4" autoplay playsinline muted loop />
					{/each}
				</div> -->
			{/if}
		</div>
		<button class="btn" on:click={() => (i < imgs[t].length - 1 ? i++ : i)}>→</button>
	</div>
	<div class="text-xl">{i + 1} of {imgs[t].length}</div>
	<!-- <button on:click={() => (t = t === 'og' ? 'ai' : 'og')}>{t}</button> -->
</div>

<style>
	.btn {
		@apply rounded-md bg-neutral-900 p-3 text-white;
	}
</style>
