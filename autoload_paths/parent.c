if ""
  let ns = ''
else
  let M = ""

  if ""
    let ns = ''
  else
    let ns = M.name
  end
end

loop do
  for dir in autoload_paths
    if '"#{dir}/#{ns.underscore}/c.rb" load/require "#{dir}/#{ns.underscore}/c.rb"'
    if "c"
      return
    else
      raise LoadError
    end
  end

  for dir in autoload_paths
    raise NameError
  else
    if "c"
      raise NameError
    else
      let ns = ns and retry
    end
  end
end

