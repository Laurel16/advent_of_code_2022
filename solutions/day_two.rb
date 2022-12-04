input = "A Y
B X
C Z"

# Part one

def calc_score(opponent, move)
  score = 0

  case move
  when 'X'
    score += 1 # 1 point for playing Rock
  when 'Y'
    score += 2 # 2 points for playing Paper
  when 'Z'
    score += 3 # 3 points for playing Scissors
  end

  case opponent
  when 'A'
    score += 6 if move == 'Y' # 6 points for winning against Rock
    score += 3 if move == 'X' # 3 points for drawing against Rock
  when 'B'
    score += 6 if move == 'Z' # 6 points for winning against Paper
    score += 3 if move == 'Y' # 3 points for drawing against Paper
  when 'C'
    score += 6 if move == 'X' # 6 points for winning against Scissors
    score += 3 if move == 'Z' # 3 points for drawing against Scissors
  end

  score
end

def total_score(input)
  rounds = input.split("\n")
  rounds.map { |round| calc_score(*round.split) }.sum
end

# Part Two

def calc_new_score(opponent, desired_outcome)
  score = 0

  # Determine the shape to play based on the desired outcome of the round
  case desired_outcome
  when 'X'
    # Choose the shape that will cause the player to lose
    case opponent
    when 'A'
      move = 'C' # Lose to Rock with Scissors
    when 'B'
      move = 'A' # Lose to Paper with Rock
    when 'C'
      move = 'B' # Lose to Scissors with Paper
    end
  when 'Y'
    # Choose the shape that will cause the round to be a draw
    case opponent
    when 'A'
      move = 'A' # Draw against Rock with Rock
    when 'B'
      move = 'B' # Draw against Paper with Paper
    when 'C'
      move = 'C' # Draw against Scissors with Scissors
    end
  when 'Z'
    # Choose the shape that will cause the player to win
    case opponent
    when 'A'
      move = 'B' # Win against Rock with Paper
    when 'B'
      move = 'C' # Win against Paper with Scissors
    when 'C'
      move = 'A' # Win against Scissors with Rock
    end
  end

  # Add points for the shape played
  case move
  when 'A'
    score += 1 # 1 point for playing Rock
  when 'B'
    score += 2 # 2 points for playing Paper
  when 'C'
    score += 3 # 3 points for playing Scissors
  end

  # Add points for the outcome of the round
  case opponent
  when 'A'
    score += 6 if move == 'B' # 6 points for winning against Rock
    score += 3 if move == 'A' # 3 points for drawing against Rock
  when 'B'
    score += 6 if move == 'C' # 6 points for winning against Paper
    score += 3 if move == 'B' # 3 points for drawing against Paper
  when 'C'
    score += 6 if move == 'A' # 6 points for winning against Scissors
    score += 3 if move == 'C' # 3 points for drawing against Scissors
  end

  score
end


def new_total_score(input)
  rounds = input.split("\n")
  rounds.map { |round| calc_new_score(*round.split) }.sum
end

puts "Total score: #{total_score(input)}"
puts "New Total score: #{new_total_score(input)}"

