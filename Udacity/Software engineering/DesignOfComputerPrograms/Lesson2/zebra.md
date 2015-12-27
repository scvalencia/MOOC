# The design of a Zebra-Puzzle solver

#### Representing Hands

Th best way for structuring hands, is a way tha allows both repeated items and rapid identification of a card's rank and suit. So a list of objects, or a list of tuples, or a list of strings is ok.

#### Specification

```Rules of Poker```

0. High card (Nothing)
1. Pair: a pair of same rank
2. Two pair: 2 pairs of same rank
3. Three of a kind: 3 cards of same rank
4. Straight: 5 sequeantial cards by rank
5. Flush: 5 cards of same suit
6. Full house: 3 cards of same rank and 2 of other same rank
7. Four of kind: 4 of same rank
8. Straight flush: Same suit in sequatial order

```
type hand : string(RS) where R in [2 .. 9, r(10) .. r(14)] /\ S in ['H', 'C', 'D', 'S']
poker : [hand] -> hand
	@returns the best hand
	
had_rank : hand -> tuple
	@return a value indicating the ranking of a hand
```


Code | Name | Description | Example | Value 
------------ | ------------- | ------------ | ------------ | ------------- 
0 | `High card` | (0, sorted(highest to lowest) hand) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img0.png" width="300" height="80" /> | (0, [7, 5, 4, 3, 2])
1 | `Pair` | (1, pair_rank, sorted(highest to lowest) hand) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img1.png" width="300" height="80" /> | (1, 2, [11, 6, 3, 2, 2])
2 | `Two pair` | (2, highest_pair_rank, other_pair_rank, sorted(highest to lowest) hand) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img2.png" width="300" height="80" /> | (2, 11, 3, [13, 11, 11, 3, 3])
3 | `Three of a kind` | (3, three_card_rank, sorted(highest to lowest) hand) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img3.png" width="300" height="80" /> | (3, 7, [7, 7 ,7 , 5, 3])
4 | `Straight` | (4, highest_card_rank) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img4.png" width="300" height="80" /> | (4, 11)
5 | `Flush` | (5, sorted(highest to lowest) hand) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img5.png" width="300" height="80" /> | (5, [10, 8, 7, 5, 3])
6 | `Full house` | (6, three_card_rank, others_card_rank) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img6.png" width="300" height="80" /> | (6, 8, 13)
7 | `Four of kind` | (7, four_cards_rank, other_card_rank) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img7.png" width="300" height="80" /> | (7, 14, 12)
8 | `Straight flush` | (8, high_card_rank ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img8.png" width="300" height="80" /> | (8, 11)

