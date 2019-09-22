Machine.new(
While.new(
LessEqual.new(Subtract.new(Number.new(2), Variable.new(:x)), Number.new(0)),
Sequence.new(
Assign.new(:x, Subtract.new(Variable.new(:x), Number.new(1))),
Assign.new(:y, Subtract.new(Number.new(3), Multiply.new(Variable.new(:x), Variable.new(:x))))
)
),
{x: Number.new(4) }
).run