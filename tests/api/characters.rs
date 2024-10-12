use crate::helpers::spawn_app;

#[tokio::test]
async fn characters_return_200() {
	// Arrange
	let app = spawn_app().await;

	// Act
	let response = app.get_characters(None).await;
	// Assert
	assert_eq!(200, response.status().as_u16());
}

#[tokio::test]
async fn character_by_id_returns_200() {
	// Arrange
	let app = spawn_app().await;
	let character_id = uuid::uuid!("863874e7-bb2b-433e-b2a5-dc408ccdafcc"); // Satoru Gojo's ID

	// Act
	let response = app.get_character_by_id(character_id).await;

	// Assert
	assert_eq!(200, response.status().as_u16());
}

#[tokio::test]
async fn character_by_id_returns_404_for_nonexistent_character() {
	// Arrange
	let app = spawn_app().await;
	let nonexistent_character_id = uuid::Uuid::new_v4(); // Assuming this ID does not exist

	// Act
	let response = app.get_character_by_id(nonexistent_character_id).await;

	// Assert
	assert_eq!(404, response.status().as_u16());
}

// #[tokio::test]
// async fn characters_search_returns_200() {
// 	// Arrange
// 	let app = spawn_app().await;
// 	let search_query = "Gojo"; // Assuming "Gojo" is a valid search term

// 	// Act
// 	let response = app.search_characters(search_query).await;

// 	// Assert
// 	assert_eq!(200, response.status().as_u16());
// }
