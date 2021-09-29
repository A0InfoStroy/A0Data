-- Состояние
Select name, snapshot_isolation_state, snapshot_isolation_state_desc from sys.databases
Select name, is_read_committed_snapshot_on from sys.databases