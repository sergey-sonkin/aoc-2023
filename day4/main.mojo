from python import Python
from collections import Dict, Optional, Set
from collections.vector import InlinedFixedVector

from utils import Variant


struct Game:
    var game_number: Int
    var num_intersection: Int
    var winning_numbers: Set[Int]
    var our_numbers: Set[Int]

    fn __init__(
        inout self,
        game_number: Int,
        num_intersection: Int,
        owned winning_numbers: Set[Int],
        owned our_numbers: Set[Int],
    ):
        self.game_number = game_number
        self.num_intersection = num_intersection
        self.winning_numbers = winning_numbers^
        self.our_numbers = our_numbers^


fn read_file(filename: String) raises -> List[String]:
    with open(filename, "r") as f:
        return f.read().splitlines()


fn parse_input_line(line: String) raises -> Game:
    alias pattern = r"Card\s*(\d+):\s+([\d\s]+)\|\s+([\d\s]+)"

    var re = Python.import_module("re")
    var regex_match = re.search(pattern, line)
    var groups = regex_match.groups()

    game_number = atol(str(groups[0]))

    mojo_winning_numbers = Set[Int]()
    for num in groups[1].split():
        mojo_winning_numbers.add(atol(str(num)))

    mojo_our_numbers = Set[Int]()
    num_intersection = 0
    for num in groups[2].split():
        to_add = atol(str(num))
        mojo_our_numbers.add(to_add)
        if to_add in mojo_winning_numbers:
            num_intersection += 1

    return Game(
        game_number=game_number,
        num_intersection=num_intersection,
        winning_numbers=mojo_winning_numbers^,
        our_numbers=mojo_our_numbers^,
    )


fn day4a(contents: List[String]) raises -> Int:
    count = 0
    for content in contents:
        var game = parse_input_line(content[])
        if num_in_common := game.num_intersection:
            count += 2 ** (num_in_common - 1)
    return count


fn day4b(game_strings: List[String]) raises -> Int:
    game_matches_map = Dict[Int, Int]()
    game_number_counts = Dict[Int, Int]()
    num_games = len(game_strings)

    ret = 0
    for game_string in game_strings:
        game = parse_input_line(game_string[])
        game_number = game.game_number
        num_intersection = game.num_intersection

        game_matches_map[game_number] = num_intersection

        counts_current_game = game_number_counts.get(game_number, 1)

        for future_game_number in range(
            game_number + 1,
            1 + min(game_number + num_intersection, num_games + 1),
        ):
            game_number_counts[future_game_number] = (
                game_number_counts.get(future_game_number, 1)
                + counts_current_game
            )
        ret += counts_current_game

    return ret


fn main() raises:
    # contents = read_file("day4_sample.txt")
    contents = read_file("day4.txt")
    day4a_answer = day4a(contents)

    print(day4a_answer)

    day4b_answer = day4b(contents)
    print(day4b_answer)
