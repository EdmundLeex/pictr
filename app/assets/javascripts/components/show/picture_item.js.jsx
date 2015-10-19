var PictureItem = React.createClass({
	handleClick: function (e) {
		this.props.handleClick(this.props.picture);
	},

	handleClickDelete: function (e) {
		ApiUtil.deletePicture(this.props.picture.id)
	},

	render: function () {
		var url = APP_CONFIG.ImageUrlBySize(
			this.props.picture.picture_url,
			APP_CONFIG.THUMBNAIL_SIZE
		);

		return (
			<div className="img-thumb">
				<img src={url} onClick={this.handleClick} />
				<div className="thumb-tools">
					<span className="thumb-delete glyphicon glyphicon-trash"
								onClick={this.handleClickDelete}></span>
				</div>
			</div>
		);
	}
});
