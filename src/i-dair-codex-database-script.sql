-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database:ri-codex-db
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dataset`
--
CREATE DATABASE IF NOT EXISTS `broker` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE DATABASE IF NOT EXISTS `mlflowdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE DATABASE IF NOT EXISTS `ri-codex-db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

USE  `ri-codex-db`;
DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `study_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test` int(11) DEFAULT NULL,
  `train` int(11) DEFAULT NULL,
  `seed` int(11) DEFAULT NULL,
  `shuffle` tinyint(4) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
CREATE TABLE `models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `hyperparameters` json DEFAULT NULL,
  `available_feature_selection` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `hyperparameter` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preferences_1_idx` (`user_id`),
  KEY `fk_preferences_2_idx` (`model_id`),
  CONSTRAINT `fk_preferences_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_preferences_2` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trainedModels`
--

DROP TABLE IF EXISTS `trainedModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainedModels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dataset` int(11) DEFAULT NULL,
  `id_model` int(11) DEFAULT NULL,
  `run_id` varchar(255) DEFAULT NULL,
  `is_best` tinyint(1) DEFAULT '0',
  `train_status` varchar(45) DEFAULT NULL,
  `train_progress` double DEFAULT '0',
  `task` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `nbr_iteration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trainingSession`
--

DROP TABLE IF EXISTS `trainingSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainingSession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_seen` tinyint(1) DEFAULT '0',
  `session_name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `session_expires_at` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Table structure for table `user-groups`
--

DROP TABLE IF EXISTS `user-groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user-groups` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_user-groups_1_idx` (`group_id`),
  KEY `fk_user-groups_2_idx` (`user_id`),
  CONSTRAINT `fk_user-groups_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `fk_user-groups_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
INSERT INTO `user` VALUES (1,'user@local.com',NULL,'local',1);
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'logistic regression','classification',1,'{\"C\": [1], \"tol\": [0.0001], \"n_iter\": 10, \"solver\": [\"lbfgs\"], \"penalty\": [\"l2\"], \"multi_class\": [\"auto\"], \"class_weight\": [null], \"folds_number\": 5, \"random_state\": [null], \"fit_intercept\": [true], \"parameter_search\": [\"BayesianOptimization\"]}',1),(2,'naive Bayes','classification',1,'{\"n_iter\": 10, \"folds_number\": 5, \"var_smoothing\": [0.000000001], \"parameter_search\": [\"BayesianOptimization\"]}',0),(3,'decision trees','classification',1,'{\"n_iter\": 10, \"splitter\": [\"random\"], \"criterion\": [\"gini\"], \"max_depth\": [null], \"folds_number\": 5, \"max_features\": [\"sqrt\"], \"random_state\": [42], \"min_samples_leaf\": [1], \"parameter_search\": [\"BayesianOptimization\"], \"min_samples_split\": []}',1),(4,'support vector machines (SVM)','classification',1,'{\"C\": [1.0], \"gamma\": [\"scale\"], \"kernel\": [\"rbf\"], \"n_iter\": 10, \"max_iter\": [1], \"probability\": [false], \"class_weight\": [null], \"folds_number\": 5, \"parameter_search\": [\"BayesianOptimization\"]}',0),(5,'Linear regression','regression',1,'{\"copy_X\": [true], \"n_iter\": 10, \"positive\": [false], \"folds_number\": 5, \"fit_intercept\": [true], \"parameter_search\": [\"BayesianOptimization\"]}',1),(6,'Xgboost','classification',1,'{\"gamma\": [0.5], \"n_iter\": 5, \"max_depth\": [3, 4, 5, 6, 7, 8, 9, 10], \"subsample\": [0.5], \"max_leaves\": [0], \"tree_method\": [\"hist\"], \"folds_number\": 5, \"n_estimators\": [100, 500, 1000, 2000], \"learning_rate\": [0.01, 0.03, 0.05, 0.1, 0.25, 0.5], \"min_child_weight\": [10], \"parameter_search\": [\"BayesianOptimization\"]}',1),(7,'Xgboost','regression',1,'{\"gamma\": [0, 0.1, 0.2, 0.3, 0.4], \"n_iter\": 5, \"max_depth\": [3, 4, 5, 6, 7, 8, 9, 10], \"reg_alpha\": [0, 0.001, 0.005, 0.01, 0.05], \"subsample\": [0.5, 0.6, 0.7, 0.8, 0.9, 1], \"reg_lambda\": [0.01, 0.1, 1, 10, 100], \"folds_number\": 5, \"n_estimators\": [10, 100, 500, 1000, 2000], \"random_state\": [42], \"learning_rate\": [0.01, 0.03, 0.05, 0.1, 0.25, 0.5], \"colsample_bytree\": [0.5, 0.6, 0.7, 0.8, 0.9, 1], \"min_child_weight\": [1, 3, 5, 7], \"parameter_search\": [\"BayesianOptimization\"]}',1),(8,'K-means','clustering',1,'{\"init\": [\"k-means++\"], \"n_init\": [10], \"n_iter\": 10, \"n_clusters\": [8], \"folds_number\": 5, \"parameter_search\": [\"BayesianOptimization\"]}',1),(9,'Random Forest Classifier','classification',1,'{\"n_iter\": 10, \"bootstrap\": [false], \"criterion\": [\"gini\"], \"max_depth\": [null], \"folds_number\": 5, \"max_features\": [\"sqrt\"], \"n_estimators\": [100], \"random_state\": [42], \"parameter_search\": [\"BayesianOptimization\"], \"min_samples_split\": []}',1),(10,'Random Forest Regression','regression',1,'{\"n_iter\": 10, \"bootstrap\": [true], \"criterion\": [\"squared_error\"], \"max_depth\": [null], \"folds_number\": 5, \"max_features\": [\"sqrt\"], \"n_estimators\": [100], \"random_state\": [42], \"parameter_search\": [\"BayesianOptimization\"], \"min_samples_split\": []}',1),(11,'Multilayer perceptron','classification',1,'{\"tol\": [0.0001], \"alpha\": [0.0001], \"n_iter\": 10, \"solver\": [\"adam\"], \"shuffle\": [true], \"max_iter\": [1], \"activation\": [\"relu\"], \"folds_number\": 5, \"random_state\": [42], \"learning_rate\": [\"constant\"], \"early_stopping\": [false], \"parameter_search\": [\"BayesianOptimization\"], \"hidden_layer_sizes\": [100], \"learning_rate_init\": [0.0001]}',0),(12,'Decision Tree Regression','regression',1,'{\"n_iter\": 10, \"splitter\": [\"best\"], \"ccp_alpha\": [0.0], \"criterion\": [\"squared_error\"], \"max_depth\": [null], \"folds_number\": 5, \"max_features\": [\"auto\"], \"random_state\": [42], \"max_leaf_nodes\": [null], \"min_samples_leaf\": [1], \"parameter_search\": [\"BayesianOptimization\"], \"min_samples_split\": [], \"min_impurity_decrease\": [0.0], \"min_weight_fraction_leaf\": [0.0]}',1);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

