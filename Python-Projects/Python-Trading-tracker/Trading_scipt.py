import csv
from datetime import datetime
import json
import operator


print()
print("Welcome to the Trader Assistant")
print("Programmed by David Northey")
print()

MAIN_MENU = '''Please choose from the options below:

 1. Load trading data
 2. Load current stock prices
 3. Manually enter a new trade
 4. View trading data
 5. View current portfolio
 6. Save trading data
 7. Quit'''


def main():


    trading_data = []
    current_prices = {}

    print(MAIN_MENU)
    menu_choice = input(">>> ")
    while menu_choice != '7':
        if menu_choice == '1':
            trading_data = load_trading_data(trading_data)
        elif menu_choice == '2':
            stock_prices = load_stock_prices()
            if stock_prices is not None:
                current_prices.update(stock_prices)
        elif menu_choice == '3':
            inputting_trade = enter_trade()
            trading_data.append(inputting_trade)
        elif menu_choice == '4':
            view_trading_data(trading_data)
        elif menu_choice == '5':
            view_portfolio(trading_data, current_prices)
        elif menu_choice == '6':
            save_trading_data(trading_data)
        else:
            print("Invalid option!")

        print(MAIN_MENU)
        menu_choice = input(">>> ")

    print("Goodbye")


def load_trading_data(trading_data):


    incorrect_format = False
    # filename = 'trades.csv'
    # TODO - get the filename from the user and perform error checking
    print()
    filename = input("What is the name of your file?: ")
    print()
    try:
        with open(filename, 'r', newline='') as file_in:
            csv_reader = csv.reader(file_in)
            for row in csv_reader:
                try:
                    row[2] = int(row[2]) # convert the quantity into an int
                    row[3] = float(row[3]) # convert the dollar value into a float
                    # TODO - convert row[4] into a datetime.date object
                    row[4] = datetime.strptime(row[4], "%Y-%m-%d").date()
                    trading_data.append(row)
                except ValueError:
                    if not incorrect_format:
                        print(f"File contains data in the incorrect format")
                        incorrect_format = True

    except FileNotFoundError:
        print("File not found")

    except UnicodeDecodeError:
        print("Error: Unable to decode the file. Please ensure file is in a supported format")

    print(f"{len(trading_data)} trades loaded.")
    print()
    return trading_data


def load_stock_prices():


    # filename = 'prices.json'
    filename = input("What is the name of your file? (Enter 'q' to quit): ")

    while filename != 'q':
        try:
            with open(filename, 'r') as file_in:
                stock_prices = json.load(file_in)
                print(stock_prices)
            return stock_prices

        except FileNotFoundError:
            print("File not found")
            filename = input("What is the name of your file? (Enter 'q' to quit): ")

        except json.decoder.JSONDecodeError:
            print("Error: Unable to decode the file. Please ensure file is in a supported format")
            filename = input("What is the name of your file? (Enter 'q' to quit): ")


def enter_trade():


    trading_data = []

    print()
    ticker = input("Enter the ticker symbol of the trade(e.g. 'XYZ'): ")
    while ticker == "":
        print("No input was entered")
        ticker = input("Enter the ticker symbol of the trade(e.g. 'XYZ'): ")

    trade_type = input("Enter if the trade was a buy or sell (b or s)").lower()
    while trade_type != "b" and trade_type != "s":

        print("Invalid selection")
        trade_type = input("Enter if the trade was a buy or sell (b or s): ")

        trade_type = get_trade_type(trade[1])

    stock_quantity = get_valid_integer("Enter the quantity of the stock (positive integer): ", "Invalid quantity, please enter a positive number")

    stock_value = get_valid_float("Enter the value of the stock (positive float): $", "Invalid value, please enter a positive number")

    valid_date = False
    while not valid_date:
        try:
            date_trade_commenced = input("Enter the date(yyyy-mm-dd format): ")
            date = datetime.strptime(date_trade_commenced, "%Y-%m-%d").date()
            valid_date = True

        except ValueError:
            print("Please enter a valid date (yyyy-mm-dd format): ")
    print()
    print("Trade added to system")
    print()
    print(f":{date} {ticker}  {trade_type} {stock_quantity:>5} for $ {stock_value:>12.2f}")
    print()



    return ticker, trade_type, stock_quantity, stock_value, date


def view_trading_data(trading_data):


    if len(trading_data) > 0:
        ticker_filter = input("Enter a ticker to view a trade (leave blank for all trades)").upper()

        max_ticker_length = max(len(trade[0]) for trade in trading_data) + 3

        matching_trades = [trade for trade in trading_data if ticker_filter == '' or ticker_filter == trade[0]]

        if len(matching_trades) == 0:
            print("No trades found")
            return

        sort_trades = input("Sort dates in reverse chronological order (y/n)")

        if sort_trades.lower() == 'y':
            matching_trades.sort(key=operator.itemgetter(4), reverse=True)

        for trade in matching_trades:
            # TODO - format the trade nicely
            ticker = trade[0]
            trade_type = get_trade_type(trade[1])

            quantity = str(trade[2])
            dollar_value = trade[3]
            date = trade[4]

            trade_type = trade_type.ljust(10)
            quantity_display = quantity.ljust(5)

            print(f":{date} {ticker:{max_ticker_length}}  {trade_type} {quantity:>5} for $ {dollar_value:>12.2f}")


def get_valid_integer(prompt, error_message):


    valid_input = False
    while not valid_input:
        try:
            result = int(input(prompt))
            if result > 0:
                valid_input = True
            else:
                print(error_message)
        except ValueError:
            print("Invalid input. Please enter a valid integer")
    return result


def get_valid_float(prompt, error_message):


    valid_input = False
    while not valid_input:
        try:
            result = float(input(prompt))
            if result > 0:
                valid_input = True
            else:
                print(error_message)
        except ValueError:
            print("Invalid input. Please enter a valid float number")
    return result


def get_trade_type(trade_type):
   if trade_type.lower() == "b" or trade_type.upper() == "BUY":
        return 'BUY'
   else:
        return 'SELL'


def view_portfolio(trading_data, current_prices):


    total_trades = {}

    for trade in trading_data:
        ticker = trade[0]
        trade_type = trade[1]
        units = trade[2]

        if ticker not in total_trades:
            total_trades[ticker] = {'units': 0, 'value': 0.0}

        if trade_type == "b" or trade_type == "BUY":
            total_trades[ticker]['units'] += units
            total_trades[ticker]['value'] += units * current_prices.get(ticker, 0)
        elif trade_type == "s" or trade_type == "SELL":
            total_trades[ticker]['units'] -= units
            total_trades[ticker]['value'] -= units * current_prices.get(ticker, 0)

    for ticker, totals in total_trades.items():
        print(f"{ticker}")
        if ticker not in current_prices and totals['units'] != 0:
            print(f"total units: {totals['units']}")
            print("Current value is unknown")
            print()
        else:
            print(f"total units: {totals['units']}")
            print(f"total value: ${totals['value']:.2f}")
            print()


def save_trading_data(trading_data):


    filename = input("What is the name of your file? (Enter 'q' to quit): ")
    while filename != 'q':
        if filename == "":
            print("Error: Filename cannot be blank. Please enter a valid filename")
            filename = input("What is the name of your file? (Enter 'q' to quit): ")
            return

        try:
            with open(f"{filename}", 'w', newline='') as file_out:
                csv_writer = csv.writer(file_out)
                for trade in trading_data:
                    csv_writer.writerow(trade)
            print("Data saved successfully")
        except IOError:
            print(f"Error: please enter a valid filename")

        break
main()