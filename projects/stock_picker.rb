# Assignment
# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:

# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker_brute_force(prices)
  max_profit = 0
  buy_best = nil
  sell_best = nil

  prices.each_with_index do |price, i|
    (i + 1...prices.length).each do |j|
      profit = prices[j] - price
      if profit > max_profit
        max_profit = profit
        buy_best = i
        sell_best = j
      end
    end
  end

  [buy_best, sell_best]
end

def stock_picker(prices)
  min_price_tracked = prices[0]
  best_profit_tracked = 0
  min_price_day = 0
  best_buy_day = 0
  best_sell_day = 0

  prices.each_with_index do |price, i|
    profit = price - min_price_tracked
    if profit > best_profit_tracked
      best_profit_tracked = profit
      best_buy_day = min_price_day
      best_sell_day = i
    end
    if min_price_tracked > price
      min_price_tracked = price
      min_price_day = i
    end
  end

  return [best_buy_day, best_sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
