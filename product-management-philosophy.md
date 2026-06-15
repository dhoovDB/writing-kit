# product-management-philosophy.md

This file is the product-thinking companion to `VOICE.md`. `VOICE.md`
governs how you write. This file governs what you decide to build and
which document you are writing. Load it for product work: PRDs,
roadmaps, build-or-buy calls, discovery, and any "should we build this"
question. For pure writing tasks, `VOICE.md` alone is enough.

The bottom line is up front. The reasoning, the frameworks, and the
skills that operationalize each one follow below.

---

## Bottom line

- Reuse over rebuild. Building is the most expensive way to solve a
  problem. Ship the smallest thing that generates signal.
- Name the phase: Problem, Solution, or Go-to-Market. One phase per doc.
- Describe what changes for the customer. Features are not products.
- Test the riskiest assumption with the smallest build. Measure real
  behavior, and pivot or persevere on the evidence.
- Run the six product-challenge questions before committing build
  capacity. The goal is to find the reason not to build.
- Pick one or two wildly important goals and act on lead measures, the
  activities you control that predict the result.

---

## Reuse over rebuild

Before designing a solution, ask whether the problem is already solved
somewhere. A third-party API, an open-source library, an existing
internal tool, a workflow change that costs nothing to ship. Building
is the most expensive way to solve a problem. Ship the smallest thing
that generates signal. Build only what you cannot buy, borrow, or fake.

The `brainstorm-experiments-new` skill surfaces pretotypes and low-cost
experiments before any build decision is made.

Reuse is the default answer, and first principles is how you
pressure-test that default before you commit to it.

## First-principles thinking

Reason from what is actually true and build up from there.
First-principles thinking is problem-solving with a beginner's mind.
You stop accepting what everyone around you knows to be true and do
the work to find out what is true, and from that, what is possible.
The alternative is reasoning by analogy: copying what others do with
small variations. Analogy gets you through the day. First principles
is how you do something genuinely new.

Start by naming the goal ("a 10x cheaper money transfer"). Break it
into the levers that gate it, the costs and constraints and steps
everyone treats as fixed. Question every assumption inside each lever,
and keep asking why until you hit the floor. That is the Five Whys from
Lean Startup aimed at assumptions: drill past inherited habit until the
answer is raw fact. Then go to the source. Read the primary research,
visit the factory, talk to the people making the raw materials, and try
the thing before you accept that it cannot be done. When Musk priced a
battery by its raw metals on the commodity market, the floor was about
$80 per kilowatt-hour against a market price of $600. The $600 was
habit.

It is expensive thinking, so spend it well. You cannot question every
assumption you hold and still get through the day. Pick the levers that
matter and reason from the ground up only where the payoff is real.
Used on the right problem, first principles shows you a floor far below
what the market assumes.

## Problem / Solution / Go-to-Market (Nils Davis)

Every product doc maps to one of three phases. Name which phase you're in.
A Problem doc defines what's broken and for whom. No solution proposed.
A Solution doc proposes the mechanism. No re-justifying the problem.
A GTM doc addresses how value reaches the customer and how success gets
measured. No re-litigating the build.

Mixing phases in one doc is how PRDs become unreadable. It is also how
meetings happen.

Use `outcome-roadmap` to enforce the phase separation at the roadmap
level. Outcome-focused roadmaps name what changes for the customer at
each phase. Feature lists do not.

## Inspired (Marty Cagan)

Products exist to solve real problems for real people. Features are not
products. The team's job is to discover what's true, then build from
there. Describe what changes for the customer. What you built is
implementation detail.

Use `opportunity-solution-tree` to structure discovery. Teresa Torres
built the OST to map a desired outcome to opportunities before touching
solutions. Build the tree before building the feature.

## Lean Startup (Eric Ries)

Stop asking whether you can build the product. Ask whether you should,
and whether a sustainable business can grow around it. Lean Startup
treats a startup as an institution operating under extreme uncertainty,
and treats every new product as an experiment that answers those two
questions before the budget is gone. The unit of progress is validated
learning. A quarter spent shipping features while learning nothing is a
quarter wasted.

Build, measure, learn. Build the minimum viable product: the smallest
version of the idea that tests the riskiest assumption. Measure what
people actually do against actionable metrics, the ones that show cause
and effect, and distrust vanity metrics that flatter the dashboard
without changing a decision. Learn whether the assumption held, and feed
the answer into the next build. The faster that loop turns, the less it
costs to be wrong.

Pivot or persevere. When the evidence backs the assumption, persevere
and scale it. When the drivers of the business refuse to move, pivot:
make a structural course correction and test a new fundamental
hypothesis about the product, the strategy, or the engine of growth. A
pivot runs on evidence. It has nothing to do with how attached you are
to the original idea.

## Test-and-learn

Every proposal starts with a clear goal: what problem, for whom, and how
will you know you solved it? State the hypothesis explicitly before
proposing a solution.

> "We believe [customer] has [problem]. We'll address it by [solution].
> We'll know it's working when [specific, measurable signal]."

Before committing build capacity to anything, run the `product-challenge`
skill. Six questions: JTBD, north star link, PMF signal, RICE score,
opportunity cost, and kill criteria. The goal is to find the reason not
to build. If any answer is "I don't know," that is the work to do first.

## The 4 Disciplines of Execution (4DX)

Strategy dies in the whirlwind. The whirlwind is the daily storm of
urgent work that eats the time your most important goal needs, and it
wins by default. 4DX is the discipline that protects the important from
the urgent. Four moves:

Focus on the wildly important. Pick one goal, two at the most. A team
chasing five priorities has none. The Wildly Important Goal is the one
where a breakthrough changes everything else, stated plainly enough that
anyone can tell whether it was hit.

Act on lead measures. A lag measure is the result you want and cannot
move directly: revenue, retention, the launch date. A lead measure is
the activity that predicts it and that you can act on this week: the
sales calls made, the interviews run, the bugs closed. Watching the lag
measure is watching the scoreboard. Moving the lead measure is playing
the game.

Keep a compelling scoreboard. Make progress visible on something simple
enough to read in five seconds, so the team always knows whether it is
winning. A scoreboard people update themselves is a scoreboard they care
about.

Create a cadence of accountability. Meet every week, review last week's
commitments, update the scoreboard, and name what each person will do
before the next session. The rhythm turns a goal into a habit, and the
habit is what survives the whirlwind.
