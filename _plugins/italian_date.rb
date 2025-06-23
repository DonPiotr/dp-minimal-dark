module Jekyll
  module ItalianDateFilter
    MONTHS = %w[
      gennaio febbraio marzo aprile maggio giugno
      luglio agosto settembre ottobre novembre dicembre
    ]

    DAYS = %w[
      domenica lunedì martedì mercoledì giovedì venerdì sabato
    ]

    def italian_date(input, format = "%-d %B %Y")
      date = input.is_a?(String) ? Time.parse(input) : input

      formatted = format
        .gsub("%A", DAYS[date.wday])
        .gsub("%B", MONTHS[date.month - 1])
        .gsub("%-d", date.day.to_s)
        .gsub("%d", "%02d" % date.day)
        .gsub("%m", "%02d" % date.month)
        .gsub("%Y", date.year.to_s)

      formatted
    end
  end
end

Liquid::Template.register_filter(Jekyll::ItalianDateFilter)

