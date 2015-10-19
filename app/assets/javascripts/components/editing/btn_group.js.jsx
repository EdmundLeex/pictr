var TitleBtnGroup = React.createClass({
	_onDeleteClick: function () {
		this.props.onDeleteClick();
	},

	_onEditClick: function () {
		// ComponentActions.toggleMode('edit');
		this.props.onEditClick();
	},

	_onSaveClick: function () {
		this.props.onSaveClick();
	},

	_onUploadClick: function () {
		this.props.onUploadClick();
	},

	_onCancelClick: function () {
		this.props.onCancelClick();
	},

	render: function () {
		var btnGrp;

		if (this.props.mode === 'new') {
			console.log('new btnGrp');
			btnGrp = (
				<div className="title-btn-group">
					<span className="glyphicon glyphicon-upload" id="upload" onClick={this._onUploadClick}></span>
					<span className="glyphicon glyphicon-remove" onClick={this._onCancelClick}></span>
				</div>
			)
		} else if (this.props.mode === 'edit') {
			console.log('edit btnGrp');
			btnGrp = (
				<div className="title-btn-group">
					<span className="glyphicon glyphicon-upload" id="upload" onClick={this._onUploadClick}></span>
					<span className="glyphicon glyphicon-trash" onClick={this._onDeleteClick}></span>
					<span className="glyphicon glyphicon-ok" onClick={this._onSaveClick}></span>
				</div>
			)
		} else {
			console.log('view btnGrp');
			btnGrp = (
				<div className="title-btn-group">
					<span className="glyphicon glyphicon-edit" onClick={this._onEditClick}></span>
					<span className="glyphicon glyphicon-upload" onClick={this._onUploadClick}></span>
					<span className="glyphicon glyphicon-trash" onClick={this._onDeleteClick}></span>
				</div>
			)
		}
		return (btnGrp);
	}
});