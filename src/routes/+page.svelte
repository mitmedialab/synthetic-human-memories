<script lang="ts">
	import { onMount } from 'svelte';
	const imgs: number[] = [1, 2, 3, 4, 5];
	let i: number = 1;
</script>

<div class="flex h-[100vh] w-[100vw] flex-col items-center justify-center gap-10">
	<div class="flex items-center gap-8 text-4xl">
		<button class="btn" on:click={() => (i > 1 ? i-- : i)}>←</button>
		<div class="aspect-square w-[50vw] max-w-md rounded-md bg-red-500">{i}</div>
		<button class="btn" on:click={() => (i < imgs.length ? i++ : i)}>→</button>
	</div>

	<div class="text-4xl">{i} of {imgs.length}</div>
</div>

<style>
	.btn {
		@apply rounded-md bg-neutral-900 p-4 text-white;
	}
</style>
