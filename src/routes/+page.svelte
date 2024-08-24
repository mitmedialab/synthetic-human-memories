<script lang="ts">
	const shuffle = (arr: string[]) => arr.sort(() => Math.random() - 0.5);
	import { page } from '$app/stores';

	const tParam = $page.url.searchParams.get('t');

	let i = 0;

	let t: 'og' | 'ai' = 'ai';
	if (tParam && ['og', 'ai'].includes(tParam)) {
		t = tParam as 'og' | 'ai';
	}

	const tps: string[] = ['dl', 'dc', 'ns'];
	const og = shuffle(
		tps.map((tp) => [...Array.from({ length: 8 }, (_, i) => `og/${tp}${i + 1}.jpg`)]).flat()
	);

	const ai = shuffle(
		tps
			.map((tp) => [
				...Array.from({ length: 8 }, (_, i) =>
					i > 3 ? `og/${tp}${i + 1}.jpg` : `ai/${tp}${i + 1}-ai.jpg`
				)
			])
			.flat()
	);

	const imgs: { og: string[]; ai: string[] } = { og, ai };

	// console.log(imgs);
</script>

<svelte:head>
	{#each [...imgs.og, ...imgs.ai] as image}
		<link rel="preload" as="image" href={`imgs/${image}`} />
	{/each}
</svelte:head>

<div class="flex h-[100vh] w-[100vw] flex-col items-center justify-center gap-10">
	<div class="flex items-center gap-8 text-4xl">
		<button class="btn" on:click={() => (i > 0 ? i-- : i)}>←</button>
		<div class="aspect-square w-[40vw] max-w-md rounded-md bg-red-500">
			<img src={`imgs/${imgs[t][i]}`} class="h-full w-full object-cover" alt="" />
		</div>
		<button class="btn" on:click={() => (i < imgs[t].length - 1 ? i++ : i)}>→</button>
	</div>

	<div class="text-3xl">{i + 1} of {imgs[t].length}</div>

	<!-- <button
		class="rounded-md bg-black p-2 text-lg text-white hover:bg-neutral-900"
		on:click={() => (t === 'ai' ? (t = 'og') : (t = 'ai'))}>set: {t}</button
	> -->
</div>

<style>
	.btn {
		@apply rounded-md bg-neutral-900 p-4 text-white;
	}
</style>
