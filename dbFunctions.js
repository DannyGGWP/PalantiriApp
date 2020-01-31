const tableName = 'matches';
const columns = ['team_number','match_number', 'auto_low_score', 'auto_high_score', 'low_score', 'high_score', 'drove_off_line', 'stage_two_wheel', 'stage_three_wheel', 'hang', 'balanced', 'starting_location', 'alliance_pos']
function init(tx) {
    tx.executeSql('CREATE TABLE IF NOT EXIST matches( team_number INTEGER PRIMARY KEY, match_number INTEGER, auto_low_score INTEGER, auto_high_score INTEGER, low_score INTEGER, high_score INTEGER, drove_off_line BOOLEAN, stage_two_wheel BOOLEAN, stage_three_wheel BOOLEAN, hang BOOLEAN, balanced BOOLEAN, starting_location STRING, alliance_pos STRING)')
}

function addMatchResult(tx,resultsArry) {
    var insertStatement = 'INSERT INTO ' + tableName + '('+columns.toString+') ' + 'VALUES ('+resultsArry.toString()+');'
    tx.executeSql(insertStatement)
}
