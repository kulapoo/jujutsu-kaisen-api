// add episodes tests here
use crate::helpers::spawn_app;

#[tokio::test]
async fn episodes_return_200() {
    // Arrange
    let app = spawn_app().await;

    // Act
    let response = app.get_episodes(None).await;
    // Assert
    assert_eq!(200, response.status().as_u16());
}


#[tokio::test]
async fn episode_by_id_returns_200() {
    // Arrange
    let app = spawn_app().await;
    let episode_id = uuid::uuid!("25f1f871-6cfa-478f-9745-45eac19fc616"); // 'For Myself', '2020-10-10', 'S01E02'

    // Act
    let response = app.get_episode_by_id(episode_id).await;

    // Assert
    assert_eq!(200, response.status().as_u16());
}

// #[tokio::test]
// async fn episode_by_id_returns_404_for_nonexistent_episode() {
//     // Arrange
//     let app = spawn_app().await;
//     let nonexistent_episode_id = uuid::Uuid::new_v4(); // Assuming this ID does not exist

//     // Act
//     let response = app.get_episode_by_id(nonexistent_episode_id).await;

//     // Assert
//     assert_eq!(404, response.status().as_u16());
// }