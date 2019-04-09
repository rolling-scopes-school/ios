#import <UIKit/UIKit.h>
/*
 You need to complete a View Controller capable of adding and substracting dates.
 It should have 3 text fields, 2 buttons and 1 label.
 The dates should be in format 20/04/2004 04:20

 You can lay out the intefrace as you wish.

 By default, the label should show the current date.
 Buttons should be titled "Add" and "Sub".

 As for the text fields, they should say "Start date", "Step" and "Date unit"
 when there was no text entered by the user.

 "Step" text field should allow only numbers, it is the step by which the date value should be increased or decreased.
 "Date unit" should only allow these values: year, month, week, day, hour, minute. If is the "what" should be added/subtracted to/from the date by "Step" values.
 By default, the counting should start from the current date, unless another date is specified in
 the "Start date" text field. If so, the modified start date should be written to the label.
 The label should be used for the output.

 Example 1:
 Current date is 20/04/2004 12:00 and it is shown by the label.
 The user enters 1 to "Step" and "day" to "Date unit", then presses "Add".
 The label changes value to 21/04/2004 12:00

 Example 2:
 Current date is 20/04/2004 12:00 and it is shown by the label.
 The user enters a different date (09/04/2019 16:00) to "Start date" field and
 the label changes its value to 09/04/2019 16:00.
 The user enters "4" to "Step" and "hour" to "Date unit", then presses "Sub" 4 times.
 With each press the label continuosly changes values:
 09/04/2019 12:00
 09/04/2019 08:00
 09/04/2019 04:00
 09/04/2019 00:00
*/
@interface DateMachine : UIViewController
@end
