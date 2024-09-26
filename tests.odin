package test

import "core:fmt"
import "core:strings"
print :: fmt.println
printf :: fmt.printf


main :: proc() {

	// main work
	print("Hello from Odin!")
	my_list := [?]string{"eat", "tea", "tan", "ate", "nat", "bat"}
	val := group_anagrams(my_list[:], context.temp_allocator)
	print("val: ", val)

	free_all(context.temp_allocator)

}

group_anagrams :: proc(
	strs: []string,
	the_allocator := context.allocator,
) -> [dynamic][dynamic]string {
	local_dict := make(map[string][dynamic]string, allocator = the_allocator)
	final_list := make([dynamic][dynamic]string, allocator = the_allocator)

	for val in strs {
		string_as_dyn_array := sorted(val, allocator = the_allocator)
		key := join_rune(string_as_dyn_array[:], allocator = the_allocator)
		// print(key)

		if key in local_dict {
			append(&(local_dict[key]), val)
		} else {
			element := make([dynamic]string, allocator = the_allocator)
			append(&element, val)
			local_dict[key] = element
		}
		// print("local_dict: ", local_dict)
	}

	for _, value in local_dict {
		append(&final_list, value)
	}

	return final_list
}

join_rune :: proc(l: []rune, allocator := context.allocator) -> string {
	// make builder
	b := strings.builder_make(allocator)
	// fill it as necessary
	for val in l {
		strings.write_rune(&b, val)
	}
	// create the final string
	final_string := strings.to_string(b)

	return final_string
}
