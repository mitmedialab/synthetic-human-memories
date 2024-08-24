<script lang="ts">
	const shuffle = (arr: string[]) => arr.sort(() => Math.random() - 0.5);

	let i = 0;
	const tps: string[] = ['dl', 'dc', 'ns'];
	const imgs = shuffle(
		tps.map((tp) => [...Array.from({ length: 8 }, (_, i) => `${tp}${i + 1}.jpg`)]).flat()
	);

	console.log(imgs);
</script>

<div class="flex h-[100vh] w-[100vw] flex-col items-center justify-center gap-10">
	<div class="flex items-center gap-8 text-4xl">
		<button class="btn" on:click={() => (i > 0 ? i-- : i)}>←</button>
		<div class="aspect-square w-[50vw] max-w-md rounded-md bg-red-500">
			<img src={`imgs/og/${imgs[i]}`} class="h-full w-full object-cover" alt="" />
		</div>
		<button class="btn" on:click={() => (i < imgs.length - 1 ? i++ : i)}>→</button>
	</div>

	<div class="text-4xl">{i + 1} of {imgs.length}</div>
</div>

<style>
	.btn {
		@apply rounded-md bg-neutral-900 p-4 text-white;
	}
</style>
