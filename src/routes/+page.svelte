<script lang="ts">
	import Gallery from '../lib/gallery.svelte';

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

	// console.log(imgs);
</script>

<Gallery t="og" />
