DO
$$
    DECLARE
        row record;
    BEGIN
        FOR row IN select * from information_schema.schemata where schema_name like '%_system'
            LOOP
                EXECUTE 'DROP schema ' || quote_ident(row.schema_name) || ' CASCADE ';
                RAISE NOTICE 'deleted schema %', row.schema_name;
            END LOOP;
    END
$$;