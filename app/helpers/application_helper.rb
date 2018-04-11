module ApplicationHelper

    def min_format(minutes)
        t = minutes * 60
        return Time.at(t).utc.strftime("%H:%M:%S")
    end

end
