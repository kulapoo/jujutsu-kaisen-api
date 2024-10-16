use crate::helpers::spawn_app;

#[tokio::test]
async fn locations_return_200() {
	// Arrange
	let app = spawn_app().await;

	// Act
	let response = app.get_locations(None).await;
	// Assert
	assert_eq!(200, response.status().as_u16());
}

#[tokio::test]
async fn location_by_id_returns_200() {
    // Arrange
    let app = spawn_app().await;
    let location_id = uuid::uuid!("75904f03-21c6-42f7-a0e5-6c3d92e52f9b"); // Shibuya, Tokyo, Japan

    // Act
    let response = app.get_location_by_id(location_id).await;

    // Assert
    assert_eq!(200, response.status().as_u16());
}