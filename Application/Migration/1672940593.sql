ALTER TABLE todos ADD COLUMN created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL;
CREATE INDEX todos_created_at_index ON todos (created_at);
