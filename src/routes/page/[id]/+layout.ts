import { error } from '@sveltejs/kit';


export function load({ params }) {
    const id = params.id;
    const n = Number(id);
    if (isNaN(n)) throw error(404, "ID must be a number!");
    return {
        counter: id
    };
}