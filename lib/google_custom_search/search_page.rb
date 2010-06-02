module GoogleCustomSearch

  class SearchPage
    def initialize values
      @values = values
    end

    def label
      @values["label"]
    end

    def start
      @values["start"].to_i
    end
  end
end