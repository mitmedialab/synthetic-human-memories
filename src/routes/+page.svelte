<script lang="ts">
	const shuffle = (arr: string[]) => arr.sort(() => Math.random() - 0.5);
	import { page } from '$app/stores';

	const tParam = $page.url.searchParams.get('t');

	let i = 0;

	type TParam = 'og' | 'ai' | 'ogv' | 'aiv';
	let t: TParam = 'ai';
	if (tParam && ['og', 'ai', 'ogv', 'aiv'].includes(tParam)) {
		t = tParam as TParam;
	}

	// const tps: string[] = ['dl', 'dc', 'ns'];
	// const og = shuffle(
	// 	tps.map((tp) => [...Array.from({ length: 8 }, (_, i) => `og/${tp}${i + 1}.jpg`)]).flat()
	// );

	// const ai = og.map((x) => {
	// 	const [loc, name] = x.split('/');
	// 	// name is in format (dc|dl|ns)_(1|2|3|4|5|6|7|8).jpg => get number
	// 	const group = name.split('.')[0].slice(0, -1);
	// 	const num = +name.split('.')[0].at(-1);
	// 	if (num > 3) return `og/${group}${num}.jpg`;
	// 	return `ai/${group}${num}-ai.jpg`;
	// });

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
		'og/dl4',
		'ai/dl1-ai',
		'og/dl6',
		'og/dl5',
		'og/ns7',
		'og/dc4',
		'og/ns4',
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

	// console.log(imgs);
</script>

<svelte:head>
	{#if ['og', 'ai'].includes(t)}
		{#each [...imgs.og, ...imgs.ai] as image}
			<link rel="preload" as="image" href={`imgs/${image}`} />
		{/each}
	{:else}
		{#each [...imgs.ogv, ...imgs.aiv] as image}
			<link rel="preload" as="video" href={`vids/${image}`} />
		{/each}
	{/if}
</svelte:head>

<div class="flex h-screen w-screen flex-col items-center justify-center gap-2 overflow-hidden px-3">
	<div class="flex items-center justify-center gap-4 text-3xl">
		<button class="btn" on:click={() => (i > 0 ? i-- : i)}>←</button>
		<div class="aspect-square w-[40vw] max-w-md overflow-hidden bg-neutral-500">
			{#if ['og', 'ai'].includes(t)}
				<img src={`imgs/${imgs[t][i]}`} class="h-full w-full object-cover" alt="" />
			{:else}
				<!-- svelte-ignore a11y-media-has-caption -->
				<video src={`vids/${imgs[t][i]}`} playsinline autoplay muted loop class="w-[40vw]"></video>
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
