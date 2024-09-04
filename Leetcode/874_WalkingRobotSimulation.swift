/// # Robot Simulation Problem
///
/// This function simulates the movement of a robot on a 2D grid based on a series of commands.
/// The robot starts at position (0, 0) and moves according to the commands provided. The goal
/// is to find the maximum distance squared that the robot gets from the origin.
///
/// ## Dry Run Explanation:
///
/// ### Example:
/// **Commands**: `[4, -1, 4, -2, 4]`  
/// **Obstacles**: `[[2, 4]]`
///
/// ### Initial State:
/// - Robot starts at position `(0, 0)`, facing **North** (upward).
/// - Maximum distance squared from the origin is `0`.
///
/// ### Step-by-Step Execution:
///
/// 1. **Command `4`**: _Move 4 units North_
///     - Move from `(0, 0)` to `(0, 4)`.
///     - No obstacles encountered.
///     - Update maximum distance squared to `max(0, 0^2 + 4^2) = 16`.
///     - Current position: `(0, 4)`, facing **North**.
///
/// 2. **Command `-1`**: _Turn right_
///     - Turn right from **North** to **East**.
///     - Current position: `(0, 4)`, facing **East**.
///
/// 3. **Command `4`**: _Move 4 units East_
///     - Move from `(0, 4)` to `(1, 4)`.
///     - Next move to `(2, 4)` is blocked by an obstacle.
///     - Stop at `(1, 4)`.
///     - Update maximum distance squared to `max(16, 1^2 + 4^2) = 17`.
///     - Current position: `(1, 4)`, facing **East**.
///
/// 4. **Command `-2`**: _Turn left_
///     - Turn left from **East** to **North**.
///     - Current position: `(1, 4)`, facing **North**.
///
/// 5. **Command `4`**: _Move 4 units North_
///     - Move from `(1, 4)` to `(1, 8)`.
///     - No obstacles encountered.
///     - Update maximum distance squared to `max(17, 1^2 + 8^2) = 65`.
///     - Current position: `(1, 8)`, facing **North**.
///
/// ### Final State:
/// - The robot ends at position `(1, 8)`.
/// - The maximum distance squared from the origin is `65`.
///
/// ### Output:
/// - The function returns `65` as the maximum distance squared the robot gets from the origin.
func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {

    /// ## Direction Enumeration
    /// Represents the four possible directions the robot can face.
    enum Direction: CaseIterable {
        case north, east, south, west
    }

    /// ## Point Structure
    /// Represents a coordinate point (x, y) on the grid.
    struct Point: Hashable {
        let x: Int
        let y: Int
    }

    // **Direction Vectors**: Maps each direction to its corresponding (dx, dy) movement.
    let directionVectors: [Direction: Point] = [
        .north: Point(x: 0, y: 1),   // North -> Move up
        .east: Point(x: 1, y: 0),    // East -> Move right
        .south: Point(x: 0, y: -1),  // South -> Move down
        .west: Point(x: -1, y: 0)    // West -> Move left
    ]

    // **Initial State**: Start at position (0, 0) facing North.
    var currentPosition = Point(x: 0, y: 0)
    var currentDirection = Direction.north

    // **Obstacles Set**: Convert obstacles array to a set of Point objects for quick lookup.
    let obstacleSet = Set(obstacles.map { Point(x: $0[0], y: $0[1]) })

    // **Maximum Distance Squared**: Initialize the maximum distance squared from the origin.
    var maximumDistanceSquared = 0

    // **Process Each Command**: Loop through each command and update the robot's state.
    for command in commands {
        if command == -1 {
            // **Turn Right**: Move to the next direction in clockwise order.
            currentDirection = Direction.allCases[(Direction.allCases.firstIndex(of: currentDirection)! + 1) % 4]
        } else if command == -2 {
            // **Turn Left**: Move to the previous direction in counterclockwise order.
            currentDirection = Direction.allCases[(Direction.allCases.firstIndex(of: currentDirection)! + 3) % 4]
        } else {
            // **Move Forward**: Move the robot in the current direction.
            let movement = directionVectors[currentDirection]!

            for _ in 1...command {
                // **Calculate Next Position**: Determine the next position based on current direction.
                let nextPosition = Point(x: currentPosition.x + movement.x, y: currentPosition.y + movement.y)

                // **Obstacle Check**: Stop moving if the next position is an obstacle.
                if obstacleSet.contains(nextPosition) {
                    break
                }

                // **Update Position**: Move to the next position.
                currentPosition = nextPosition

                // **Update Maximum Distance Squared**: Calculate and update the maximum distance squared.
                maximumDistanceSquared = max(maximumDistanceSquared, currentPosition.x * currentPosition.x + currentPosition.y * currentPosition.y)
            }
        }
    }

    // **Return Result**: The maximum distance squared the robot gets from the origin.
    return maximumDistanceSquared
}