import Map "mo:core/Map";
import Text "mo:core/Text";
import Time "mo:core/Time";
import List "mo:core/List";
import Iter "mo:core/Iter";
import Principal "mo:core/Principal";

actor {
  type HabitId = Text;
  type Date = Text; // Using Text for date representation (YYYY-MM-DD)

  type Habit = {
    id : HabitId;
    name : Text;
    color : Text;
    createdAt : Date;
  };

  type Completion = {
    habitId : HabitId;
    date : Date;
    completed : Bool;
  };

  type User = {
    displayName : Text;
  };

  var users : Map.Map<Principal, User> = Map.empty<Principal, User>();
  var userHabits : Map.Map<Principal, Map.Map<HabitId, Habit>> = Map.empty<Principal, Map.Map<HabitId, Habit>>();
  var userCompletions : Map.Map<Principal, Map.Map<HabitId, List.List<Completion>>> = Map.empty<Principal, Map.Map<HabitId, List.List<Completion>>>();

  // Helper function to generate unique HabitId
  func generateHabitId(name : Text) : HabitId {
    let timestamp = debug_show (Time.now());
    name # timestamp;
  };

  // Helper function to get current date in YYYY-MM-DD format
  func getCurrentDate() : Date {
    // This is a placeholder. In practice, you'd convert Time.now() to a date string.
    debug_show (Time.now());
  };

  // User management functions
  public shared ({ caller }) func setDisplayName(displayName : Text) : async () {
    users.add(caller, { displayName });
  };

  public shared query ({ caller }) func getDisplayName() : async ?Text {
    switch (users.get(caller)) {
      case (null) { null };
      case (?user) { ?user.displayName };
    };
  };

  // Create a new habit
  public shared ({ caller }) func createHabit(name : Text, color : Text) : async HabitId {
    let id = generateHabitId(name);
    let habit : Habit = {
      id;
      name;
      color;
      createdAt = getCurrentDate();
    };

    let userHabitsMap = switch (userHabits.get(caller)) {
      case (null) { Map.empty<HabitId, Habit>() };
      case (?h) { h };
    };

    let userCompletionsMap = switch (userCompletions.get(caller)) {
      case (null) { Map.empty<HabitId, List.List<Completion>>() };
      case (?c) { c };
    };

    userHabitsMap.add(id, habit);
    userCompletionsMap.add(id, List.empty<Completion>());

    id;
  };

  // Update habit details
  public shared ({ caller }) func updateHabit(id : HabitId, name : Text, color : Text) : async Bool {
    switch (userHabits.get(caller)) {
      case (null) { false };
      case (?userHabitsMap) {
        switch (userHabitsMap.get(id)) {
          case (null) { false };
          case (?existingHabit) {
            let updatedHabit : Habit = {
              id;
              name;
              color;
              createdAt = existingHabit.createdAt;
            };
            userHabitsMap.add(id, updatedHabit);
            true;
          };
        };
      };
    };
  };

  // Mark habit completion for a specific date
  public shared ({ caller }) func markCompletion(habitId : HabitId, date : Date, completed : Bool) : async Bool {
    switch (userCompletions.get(caller)) {
      case (null) { false };
      case (?userCompletionsMap) {
        switch (userCompletionsMap.get(habitId)) {
          case (null) { false };
          case (?existingCompletions) {
            let completion : Completion = {
              habitId;
              date;
              completed;
            };
            existingCompletions.add(completion);
            true;
          };
        };
      };
    };
  };

  // Get all habits
  public shared query ({ caller }) func getHabits() : async [Habit] {
    switch (userHabits.get(caller)) {
      case (null) { [] };
      case (?userHabitsMap) { userHabitsMap.values().toArray() };
    };
  };

  // Get completions for a specific habit
  public shared query ({ caller }) func getHabitCompletions(habitId : HabitId) : async [Completion] {
    switch (userCompletions.get(caller)) {
      case (null) { [] };
      case (?userCompletionsMap) {
        switch (userCompletionsMap.get(habitId)) {
          case (null) { [] };
          case (?completionList) {
            completionList.toArray();
          };
        };
      };
    };
  };

  // Delete a habit
  public shared ({ caller }) func deleteHabit(habitId : HabitId) : async Bool {
    switch (userHabits.get(caller)) {
      case (null) { false };
      case (?userHabitsMap) {

        userHabitsMap.remove(habitId);

        // Also remove completions for this habit
        switch (userCompletions.get(caller)) {
          case (null) { false };
          case (?userCompletionsMap) {
            userCompletionsMap.remove(habitId);
            true;
          };
        };

      };
    };
  };

};
