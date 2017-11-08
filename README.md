## `trader-tools`

Small Ruby library of historical trade analysis tools for people using the Bitfinex API.

### Usage

*NOTE*: You will need to [obtain Bitfinex API credentials](https://www.bitfinex.com/api) for programmatic access to your account.

Download this repo and install dependencies:

```bash
git clone https://github.com/mecampbellsoup/trader-tools
bundle install
```

Export your API credentials:

```bash
export BITFINEX_API_KEY=aaabbbccc
export BITFINEX_API_SECRET=dddeeefff
```

For a particular asset that you have traded, run some analysis:

```bash
bin/calculate-pnl BT1BTC
bin/calculate-pnl BT2BTC
bin/calculate-pnl BTCUSD
bin/calculate-pnl ETHBTC
```
The executable prints output like the following:

```bash
15:50:25 › bin/calculate-pnl BT2BTC
{
                   :total_volume => 21.04213372,
                     :total_buys => 0,
                    :total_sells => 21.04213372,
     :weighted_average_buy_price => 0,
    :weighted_average_sell_price => 0.16940169428649887,
                   :total_profit => 0.38508138952073
}
```
