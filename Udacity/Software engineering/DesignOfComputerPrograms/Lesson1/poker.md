# The design of Poker

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
<center>


Code | Name | Description | Example | Value 
------------ | ------------- | ------------ | ------------ | ------------- 
0 | `High card` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img0.png" width="300" height="80" /> | (0, 6)
1 | `Pair` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img1.png" width="300" height="80" /> | (0, 6)
2 | `Two pair` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img2.png" width="300" height="80" /> | (0, 6)
3 | `Three of a kind` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img3.png" width="300" height="80" /> | (0, 6)
4 | `Straight` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img4.png" width="300" height="80" /> | (0, 6)
5 | `Flush` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img5.png" width="300" height="80" /> | (0, 6)
6 | `Full house` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img6.png" width="300" height="80" /> | (0, 6)
7 | `Four of kind` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img7.png" width="300" height="80" /> | (0, 6)
8 | `Straight flush` | (0, ) | <img src="https://raw.githubusercontent.com/scvalencia/MOOC/master/Udacity/Software%20engineering/DesignOfComputerPrograms/img/img8.png" width="300" height="80" /> | (0, 6)

</center>

