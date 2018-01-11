module MigratoinHelpers

	def foreign_key(from_table, form_column, to_table)
	  constraint_name = "sk_#{from_table}_#{to_table}"
	  
	  execute %{
	    CREATE TRIGGER #{constraint_name}_insert
	    BEFORE INSERT ON #{from_table}
	    FOR EACH ROW BEGIN
	      SELECT
	        RAISE(ABORT, "constraint violation: #{constraint_name}")
	      WHERE
	        (SELECT id FROM #{to_table} WHERE id = NEW.#{form_column}) IS NULL;
	    END;
	  }

	  execite %{
	    CREATE TRIGGER #{constraint_name}_update
	    BEFORE UPDATE ON #{from_table}
	    FOR EACH ROW BEGIN
	      SELECT
	        RAISE(ABORT, "constraint violation: #{constraint_name}")
	      WHERE
	        (SELECT id FROM #{to_table} WHERE id = NEW.#{from_column}) IS NULL;
	    END;
	  }

	  execute %{
	    CREATE TRIGGER #{constraint_name}_delete
	    BEFORE_DELETE_ON #{to_table}
	    FOR EACH ROW BEGIN
	      SELECT
	        RAISE(ABORT, "constraint violation: #{constraint_name}")
	      WHERE
	        (SELECT id FROM #{from_table} WHERE #{form_column} = OLD.id) IS NOT NULL;
	    END;
	  }
	end
end

