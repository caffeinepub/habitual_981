# Habitual - Habit Tracker Application

## Overview

A simple habit tracking application that allows users to create and manage daily habits with visual progress tracking through a 2-week grid display and detailed 6-month history view. The app integrates with Internet Identity for secure authentication and profile management.

## Authentication & User Management

### Internet Identity Integration

- App uses Internet Identity for secure, decentralized authentication
- No traditional username/password required
- Users can sign in across devices using Internet Identity

### Welcome Screen

- Unauthenticated users see a welcome screen with:
  - App logo (Check icon with green radial gradient)
  - Welcome message and feature overview
  - Sign-in button with Internet Identity
  - Feature highlights with icons (Target, Heart, Plus icons)

### Profile Management

- Users can set and edit display names
- Display name editing uses a modal interface for mobile-friendly experience
- Profile dropdown provides access to:
  - Edit Display Name (opens modal)
  - Sign Out functionality

## Visual Design Theme

### Color Scheme

- Primary color theme uses variations of green for wellness and goal-oriented feel
- Background features a subtle gradient from very light yellow (upper left) to very light green (lower right)
- Logo uses green radial gradient with Check icon
- Add Habit button has green fill with darker green hover state

### Logo Design

- Check icon (✓) with green radial gradient background
- Perfect square aspect ratio (1:1)
- Positioned left of app name in header
- Symbolizes completion and achievement

### Card Styling

- Habit cards use light colored backgrounds derived from habit colors (approximately 5% color, 95% white)
- Card borders use the full habit color for definition
- Rounded corners with subtle shadows
- No redundant colored circles (removed for cleaner design)

## Core Features

### Header Layout

#### Desktop Layout (≥768px)

- Logo and app name positioned left with right padding
- App name "Habitual" with subtitle positioned next to logo
- Add Habit button and Profile section positioned right, arranged horizontally

#### Mobile Layout (≤767px)

- Logo and app name remain left-aligned
- Right-side buttons stack vertically in reverse order:
  - Profile section displays on top
  - Add Habit button displays below
- Maintains proper spacing and touch targets

### Habit Management

#### Habit Creation

- Modal-based creation interface
- Users can create multiple daily habits
- Each habit requires a name (max 50 characters)
- Random color assignment from diverse rainbow palette
- Color selection from 16 preset colors during creation
- Modal follows consistent design patterns

#### Habit Editing

- Modal-based editing interface
- Users can modify habit name and color
- Same color palette as creation
- Edit and delete buttons accessible from habit cards

#### Habit Colors

- 16 preset colors spanning the rainbow spectrum
- Colors include: Red, Orange, Amber, Yellow, Lime, Green, Emerald, Cyan, Sky, Blue, Indigo, Violet, Purple, Fuchsia, Pink, Rose
- Each habit gets a random color assignment upon creation
- Colors are fully customizable during creation or editing

### Visual Progress Display

#### Main Habit Cards

- Cards displayed in centered container for horizontal alignment
- Each card width fits its content
- Cards use light colored backgrounds derived from habit colors
- Card borders use full habit colors for visual definition

#### 2-Week Tracking Grid

- Grid contained within centered layout
- 7 squares per row representing days of the week
- Two rows stacked vertically:
  - Top row: Previous week (Monday to Sunday)
  - Bottom row: Current week (Monday to Sunday, up to today)
- Day labels displayed above grid (Mon, Tue, Wed, Thu, Fri, Sat, Sun)
- Each square represents one day with specific styling

#### Square Visual States

- **Completed days**: Filled with radial gradient transitioning from lighter shade of habit color (center) to darker shade (edges), white checkmark icon
- **Incomplete days**: White background with light gray border (rgb(198, 199, 200))
- **Today's square**:
  - Uncompleted: Transparent background with habit color border
  - Completed: Radial gradient fill with habit color border and subtle glow effect
  - Subtle pulsing animation when completed

### Daily Tracking

#### Interaction Behavior

- Only current day's square is interactive and clickable
- All other squares are non-interactive (display only)
- Click toggles completion status between completed/incomplete
- Visual state updates immediately (optimistic UI)
- Backend synchronization occurs after UI update
- Each habit tracks completion independently

#### Current Day Logic

- Automatically identifies current day based on day of week
- Displays in appropriate column of bottom row
- Interactive state persists until next day
- Visual feedback for successful completion

### Detailed History View

#### 6-Month Modal Display

- Clicking habit card (except current day square) opens history modal
- Modal uses same colored background/border system as main cards
- Displays last 6 months of completion data
- Modal header shows habit name and description
- Close button for easy dismissal

#### Calendar Layout

- Data organized as monthly calendar grids
- Each month displays as separate block
- Proper calendar layout with empty cells for visual alignment
- Month labels displayed above each calendar block
- Responsive grid layout (1-3 columns based on screen size)

#### Visual Styling

- Same square styling as main view:
  - Completed: Radial gradient with white checkmark
  - Incomplete: White background with light gray border
  - Future dates: Invisible/transparent for clean layout
- All squares are non-interactive (display only)
- Emphasizes visual continuity and pattern recognition

## Mobile Responsive Design

### Breakpoint

- Mobile layout activates at 767px and below
- Desktop layout for 768px and above

### Header Adaptations

- Logo and title remain left-aligned
- Right-side buttons stack vertically in reverse order
- Maintains touch-friendly spacing and sizing
- Profile dropdown remains functional

### Modal Interfaces

- Display name editing uses full-screen modal
- All modals are mobile-optimized
- Touch-friendly button sizing and spacing
- Proper form validation and feedback

## Backend Data Storage

### User Data

- Internet Identity integration for authentication
- User profiles with display names
- Secure user isolation

### Habit Data

- Habit records: name, color, creation date, user association
- Daily completion records: habit ID, date, completion status, user association
- 6-month historical data retention

### Data Security

- All user data isolated by Internet Identity
- Secure habit and completion data storage
- No cross-user data access

## Backend Operations

### Authentication

- Internet Identity login/logout
- User session management
- Profile data retrieval

### Habit Management

- Create new habits with random color assignment
- Update habit details (name, color)
- Delete habits and associated completion data
- Retrieve user's habit list

### Completion Tracking

- Record daily habit completion for individual habits
- Toggle completion status
- Retrieve completion history for 2-week display
- Retrieve 6-month completion history for detailed view

### Profile Management

- Set and update user display names
- Retrieve current display name
- Profile data persistence across sessions

## User Experience Features

### Optimistic UI Updates

- Immediate visual feedback for completion toggles
- Smooth animations and transitions
- Consistent loading states

### Modal System

- Consistent modal design patterns
- Mobile-friendly interfaces
- Proper focus management and accessibility

### Visual Continuity

- Color theming throughout application
- Consistent spacing and typography
- Cohesive design language

### Performance Optimization

- Efficient data loading and caching
- Smooth animations with minimal performance impact
- Responsive design for all screen sizes
