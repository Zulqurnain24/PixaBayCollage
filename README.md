# PixaBayCollage
This application demonstrates TDD approach with MVVM with swiftui &amp; Combine

## TDD Approach ##

1-Write a failing test
2-Then write code to pass the test
3-Pass the test
4-Refactore code
  +------------------+
  |     Write a      |
  |   failing test   |
  +------------------+
             |
             v
  +------------------+
  |   Run the test   |
  |   (Test fails)   |
  +------------------+
             |
             v
  +------------------+
  |   Write the      |
  |    code          |
  +------------------+
             |
             v
  +------------------+
  |   Run the test   |
  |   (Test passes)  |
  +------------------+
             |
             v
  +------------------+
  |    Refactor      |
  |    the code      |
  +------------------+

## MVVM ##

1-Implement the entities
2-Implement subsystems for implementing the business logic
3-Implement viewModel using dependency injection
4-Use subsystems inside the viewModel to implement the business logic
5-Implement the view and use viewmodel to implement business logic
6-Transform data in viewmodel if required


   +-----------------+
   |     Model       |
   +-----------------+
         |   ^
         v   |
   +-----------------+
   |     View        |
   +-----------------+
         |   ^
         v   |
   +-----------------+
   |   ViewModel     |
   +-----------------+
