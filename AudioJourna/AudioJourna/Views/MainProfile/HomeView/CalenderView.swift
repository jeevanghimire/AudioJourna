import SwiftUI
import EventKit

struct CalenderView: View {
    @State private var events: [EKEvent] = []
    @State private var selectedDate: Date = Date()
    @State private var eventStore = EKEventStore()

    var body: some View {
        VStack {
            // Custom Calendar View
            CalendarGridView(selectedDate: $selectedDate)
                .padding()
           
        }
        .onAppear {
            requestAccessToCalendar()
        }
        .onChange(of: selectedDate, perform: { newValue in
            loadEvents(for: newValue)
        })
        .navigationTitle("Custom Calendar")
    }

    // Request access to the user's calendar
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: .event) { granted, error in
            if granted {
                loadEvents(for: selectedDate)
            } else {
                print("Access denied: \(String(describing: error?.localizedDescription))")
            }
        }
    }

    // Load events for the selected date
    func loadEvents(for date: Date) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!

        let predicate = eventStore.predicateForEvents(withStart: startOfDay, end: endOfDay, calendars: nil)

        self.events = eventStore.events(matching: predicate)
    }

    // DateFormatter for the selected date
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct CalendarGridView: View {
    @Binding var selectedDate: Date
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let calendar = Calendar.current
    private let currentMonth: Date

    // Day names for the top row
    private let dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self.currentMonth = Date()
    }

    var body: some View {
        VStack {
            // Display day names (Sun, Mon, etc.)
            LazyVGrid(columns: columns) {
                ForEach(dayNames, id: \.self) { dayName in
                    Text(dayName)
                        .bold()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
            
            // Display days of the month
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(daysInMonth(), id: \.self) { date in
                    Text("\(calendar.component(.day, from: date))")
                        .frame(width: 40, height: 40)
                        .background(calendar.isDate(date, inSameDayAs: selectedDate) ? Color.brown : Color.clear)
                        .cornerRadius(25)
                        .onTapGesture {
                            selectedDate = date
                        }
                }
            }
        }
    }

    // Get all days for the current month
    func daysInMonth() -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: currentMonth) else { return [] }
        var days = [Date]()
        
        // Fetch first day of the current month
        let firstDayOfMonth = monthInterval.start
        
        // Get the weekday of the first day (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
        let weekdayOfFirstDay = calendar.component(.weekday, from: firstDayOfMonth) - 1
        
        // Add empty dates for alignment (before the first day of the month)
        for _ in 0..<weekdayOfFirstDay {
            days.append(Date.distantPast) // Placeholder date for empty spots
        }
        
        calendar.enumerateDates(startingAfter: monthInterval.start, matching: DateComponents(hour: 0), matchingPolicy: .nextTime) { date, _, stop in
            if let date = date, date < monthInterval.end {
                days.append(date)
            } else {
                stop = true
            }
        }
        return days
    }
}

#Preview {
    CalenderView()
}
