def group_anagrams(strs: list[str]) -> list[list[str]]:
    local_dict: dict[str, list[str]] = dict()

    for val in strs:
        key = "".join(sorted(val))
        if key in local_dict:
            # if it's there, append the value
            local_dict[key].append(val)
        else:
            # if it's not there, create a list and append the value to it
            local_dict[key] = []
            local_dict[key].append(val)

    return list(local_dict.values())


def main() -> None:
    val = group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    print(val)


if __name__ == '__main__':
    main()

#  strs = ["eat","tea","tan","ate","nat","bat"]
