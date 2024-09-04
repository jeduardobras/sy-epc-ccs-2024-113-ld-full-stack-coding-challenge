# Recruitment Challenge

## Table of Contents
1. [Introduction](#intro)
2. [The Puzzle Game](#puzzle-game)\
2.1 [Game Objective](#puzzle-objective)\
2.2 [Game Rules](#puzzle-rules)\
2.3 [Puzzle Example](#puzzle-example)\
2.4 [Puzzle Definitions](#puzzle-definitions)
3. [Solving the Challenge](#solving)\
3.1 [Priority](#solving-priority)\
3.2 [Instructions](#solving-instructions)\
3.3 [Challenge Constraints](#solving-constraints)
4. [Submission](#submission)\
4.1 [Evaluation of Your Submission](#sub-eval)\
4.2 [How to Submit Your Solution](#sub-how)
5. [FAQ](#faq)

<a name="intro"></a>

## 1. Introduction
Welcome to the CCS Puzzle Challenge!

The challenge consists of two parts:

   - Part I: Implementation of a full-stack web application
   - Part II: Implementation of a python program

While being independent from each other, both parts are based on the same puzzle game  explained below.

<a name="puzzle-game"></a>

## 2. The Puzzle Game

Like other puzzles, this puzzle game consists of several colored pieces which need to be arranged in a certain way for the puzzle to be solved. The complexity of the puzzle varies depending on the number of pieces ($d^2$) and the number of colors ($c$) used by the puzzle. The nature of each piece, however, is the same: a square tile with four colored sides. Hence, the puzzle pieces shall be called `tiles` from now on.

<a name="puzzle-objective"></a>

### 2.1 Game Objective
The goal of the game is to place all $d^2$ tiles in such a way that they make up a $d$ x $d$ square while making sure that the color of a tile's side matches the color of the adjacent tile's side. In other words: Neighbouring tiles need to have the same color on both sides of their border.

<a name="fig1"></a>

| ![Figure 1](./img/puzzle_invalid_valid.png) |
|:--:|
| *Figure 1: Example puzzle with invalid and valid arrangement* |

<a name="puzzle-rules"></a>

### 2.2 Game Rules
1. All $d^2$ tiles of the puzzle's tile deck have to be placed in a $d$ x $d$ square.
2. Neighbouring tiles need to have the same color on both sides of their border.
2. The order in which the tiles are placed can be chosen freely.
3. Tiles can be rotated freely and as often as desired (90°, 180°, 270°).

<a name="puzzle-example"></a>

### 2.3 Puzzle Example
The example puzzle shown in *[Figure 1](#fig1)* has a dimension of $d=2$ and a color range of size $c=5$. Together, these define a puzzle specific tile deck consisting of four tiles ($2^2$) and five different colors. To solve the puzzle, the tiles have to be placed in a $2$ x $2$ square while obeying the color matching rule as shown in the *valid* square of *[Figure 1](#fig1)* and *[Figure 2](#fig2)*.

Following the rules described in section *[2.2 Game Rules](#game-rules)*, a player could perform the following actions to solve the example puzzle:

<a name="fig2"></a>

| ![Figure 2](./img/puzzle_steps.png) |
|:--:|
| *Figure 2: Possible sequence of actions to solve the example puzzle* |

⚠️ It is <ins>important to note</ins> that *[Figure 2](#fig2)* only shows one of many possible action sequences. A player is free to choose the order of actions. For solving a puzzle, it only matters that eventually a valid arrangement is found, independent of how a player arrived at the solution. It is common that a player places a tile, rotates it multiple times, and then puts it back to the deck in order to try different arrangements.

<a name="puzzle-definitions"></a>

### 2.4 Puzzle Definitions
|<div style="width:110px; white-space:nowrap;">Name</div>|Definition|
|-|-|
|`d`| $d ∈ \{2,3,4\}$ defines a puzzle's dimension which determines the size of a puzzle's tile deck ($d^2$) and the dimension of a puzzle's solution square ($d$ x $d$).|
|`c`|$c ∈ \{1,2,3,4,5,6,7,8,9,10,11,12\}$ defines the number of different colors used by a puzzle (color range) and is independent of the dimension $d$.|
|`color`|A color is defined by its unique hex color code. E.g. <code><span style="color:#ff868e">#ff868e</span></code>|
|`color range`|A puzzle's color range describes a set of unique colors used by the puzzle. It can vary from puzzle to puzzle and is typically chosen by the creator of the puzzle. The size of the color range (number of colors used) is referred to as $c$. Example set for $c=4$: <code>[<span style="color:#ff868e">#ff868e</span>, <span style="color:#82cceb">#82cceb</span>, <span style="color:#b5e5a2">#b5e5a2</span>, <span style="color:#fff292">#fff292</span>]</code>.|
|`tile deck`|A puzzle's tile deck is a set of puzzle tiles. The size of a tile deck ($d^2$) refers to the number of tiles in the game.|
|`tile`|A tile is one of the pieces that a puzzle is made of. A tile is defined by its four sides and its unique identifier $i$.
|`tile side`|Each side of a tile has a color from the puzzle's color range assigned. There can be tiles with the same color on multiple sides and there can be multiple tiles with the same constellation of colors in the same tile deck.|
|`neighbor`| Two tiles $\alpha$ and $\beta$ are considered neighbors if a side of $\alpha$ faces a side of $\beta$ (and vice versa).|
|`action`| Each of the following counts as single action: *moving a tile*, *rotating a tile*, and *resetting the tile arrangement*. *Moving a tile* includes, taking a tile from the deck, putting a tile back to the deck, and moving a tile from one position to another in the solution square. Resetting the arrangement means putting all tiles back to the tile deck, in their initial order and orientation.|

<a name="solving"></a>

## 3. Solving the Challenge

<a name="solving-priority"></a>

### 3.1 Priority

Both parts of the challenge can be solved independently from each other. Ideally, you should solve both parts. However, should you be constrained by time, you should prioritize Part I over Part II.

<a name="solving-instructions"></a>

### 3.2 Instructions
The part specific instructions and development tasks are further described in the following directories:

[./part-1](./part-1/): Instructions and source files for Part I.

[./part-2](./part-2/): Instructions and source files for Part II.

To solve this challenge, you must follow the instructions given by the README.md files residing in those directories. The source files in the directories should be used as baseline for the solution of the respective part. This means, your solutions should be contained within those directories. Please use git while implementing your solution to keep track of your commit history.

<a name="solving-constraints"></a>

### 3.2 Challenge Constraints
- Please keep your repository private. Do not fork or publish this challenge. We would like to avoid your progress being copied by other candidates.
- This challenge is meant to represent a real world scenario, so please implement it just as you would while working in a real office environment.
- This challenge is to be solved by you alone. If this challenge overwhelms you, the actual job will do so, too.
- You are free to use AI assistance tools (e.g. github copilot, chatgpt, ...), web search, documentation, tutorials, etc.
- Additionally, please also respect the part specific development constraints:
   - [Part I: Development Constraints](./part-1/README.md#dev-constraints)
   - [Part II: Development Constraints](./part-2/README.md#dev-constraints)

<a name="submission"></a>

## 4. Submission

<a name="sub-eval"></a>

### 4.1 Evaluation of Your Submission
Please note that we will evaluate your submission based on the following aspects, ordered by importance (most important first).
1. Functionality and UX: Does the provided solution work? Does it correctly do what was asked? Does it do so with good usability (i.e. does it provide a good user experience)?
2. Code Quality: Is the code clean, readable, and maintainable? Are best practices followed?
3. Performance: Is the solution scalable? How performant does it work for complex datasets?

<a name="sub-how"></a>

### 4.2 How to Submit Your Solution
1. Please pack your solution in a zip file. It should contain the entire repository, including your .git folder and commit history.
2. Please name your zip file by the following format: `firstname_lastname.zip`, where firstname is your first name and lastname is your last name.
3. Please make sure to submit your zip file by following the instructions you received via e-mail along with the invitation to this challenge. In particular
   - submit it before the stated deadline.
   - submit it by uploading it to the linked location.

Good luck :)

<a name="faq"></a>

## 5. FAQ
Before contacting us, please have a look at the frequently asked questions below, which might answer some of the questions you have.

---

**Q01:** Can I fork the repository and keep it public?\
**A01:** No. Please keep the repository private. We want to avoid that candidates can view the progress of other candidates that are working on the same challenge.

---

**Q02:** Can I use other technologies for my solution (e.g. TypeScript, Angular, React, Django, Flask, ...) ?\
**A02:** No. It would require additional packages, which is not allowed according to the challenge constraints. We want that candidates use the same technologies, so we can ensure an equal comparison of the submissions.

---


**Q03:** I think the list of allowed packages is incomplete. Implementing feature XYZ without package ABC would be reinventing the wheel. Can I add package ABC?
**A03:** Reach out to us. We will review the package and decide if it can be included. If yes, then it will be available to all candidates.

---

**Q04:** Does the UI/UX influence the evaluation of the submission?\
**A04:** Yes. We take the user experience of your solution into account and it is going to be evaluated as strong as the functionality of the solution.

---

**Q05:** Is a puzzle considered solvable, if its tile deck contains only cards that are made up of the same color on all sides (i.e. only one color is used) ?\
**A05:** Yes. In this case, the puzzle is automatically solved in any possible arrangement.

---

**Q06:** While playing a game, can a user rotate the tiles in anti-clockwise direction too? Specifically can a user rotate a tile from 0° to 270° in one step?\
**A06:** This is up to you. You can implement it in a way that you believe provides a good user experience. It's just important that all four rotation steps can be reached.

---

**Q07:** Can a user rate a game only once they've successfully finished the game (state = SOLVED), or can they also rate it while the state is NEW or STARTED?\
**A07:** Puzzles can only be rated in state SOLVED.

---

**Q08:** Candidates can choose which and how statistics should be displayed for the Puzzle statistics feature of Part I. Given this, if I only have enough time to either implement all described statistics or attempt Part II of the challenge, which one should I prioritize?\
**A08:** That's correct, you can choose which statistics you want to display and how you want to display them. You should prioritize Part 2 over delivering the full set of statistics.

---

**Q09:** I would like to verify if my understanding of the Puzzle Progress feature of Part I is correct. Could you please let me know if the underlined statements below are correct:
```
t1 - User opens a puzzle in browser Firefox
t2 - User changes puzzle state to S1 in Firefox
t3 - User opens same puzzle in Chrome and sees the puzzle in state S1
t4 - User changes puzzle state in Chrome from S1 to S2
t5 - User changes puzzle state in Firefox from S1 to S3
t6 - User reloads page in Chrome - and sees the puzzle in state S3 (even though the last puzzle state in Chrome was S2)
```
**A09:** Your understanding is generally correct. Ideally, the browsers should be aware of the current puzzle state at all times. E.g. in t5, Firefox could know that the puzzle is in S2.
