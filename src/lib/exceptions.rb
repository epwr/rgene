



# Allow catching all intentionally thrown errors by having a base error for the
# gem
class RGeneError < StandardError; end

# Specific Errors
class DirectoryExistsError < RGeneError; end
