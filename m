Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3882606A330
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icHbSXjn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2457011261E;
	Thu, 22 Oct 2026 13:28:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0F1112654
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA0BjA2396845
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=ZY5crMLc0RdN6Ac0
 w70ny/ZHfSFENHrnhAnoLhyPJXR8HSTKXy/3IX56AZAfRAf+MJDejryHc5gI1Nsi
 Wqhm66LCtcz5o8JIZ2Dr8xC8yXQtWPSxkAWsk55N5saZoHQFWjlo7XXebJCY69Qp
 qFBUjnulQkMYcSYfU8KUOOS+f0Oa8R0ppgQ1Zyj5WXuhVyLYITU6VRWUdXXwkV+U
 tnzMsSf/Uvz2cuLGArchUxG8nvr4nyfRIrRNAKGy0Z77syXsYFaFD5irD/JsMKts
 69unpf9U+b+3dzSEO4oAB4/jMlutYtjGcYkRNu3fW37GG6fRcGple8NqNdspo+Bh
 4qOFuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bur3p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb6391e89so415444385a.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675709; x=1793280509;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
 b=icHbSXjnpgoEGY6bokl1w1BDfKYlo8olyErCPFi1YcaGT/mggWsxaZSL/8MRL0tuZG
 LYwALLoUfn++jpomiRl5VQtD9hKfF3Xty60V+x0mRYLe0QEaj3sjGUfrp+VVPxLDqXek
 bwDNA4eBJQ4lpXEsDVu9hxlgQeQJg4aQ44e3eu7UjpHq9hCqzWrIADAJSADaR7enjdir
 cA2NFmXRn5Lf/Pa0y+yhD8LGVRAMWxasuDAm2ULLmb6tJpcoqKxXBvG5MDOypgwuGGGG
 77vVAw2c/gEmEG/hO/SdzAbUketg7VXVRlbD833GPhZFX5FkJkumUh6tRTCSZWHqADXn
 TMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675709; x=1793280509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
 b=YdGpBb8z4R3nql7Uyxp7eXSCL8+LprXv4qqs/JoPZgW3x3n7adQjVGIm8PMhzBT31P
 usrOvnU+BX8wqlF6OQ8yMC+5ng0O2k1+nhOu8Rj59uUd8iDAswhwM2lXa4Z0xh9jrNiF
 G19ZBqBvG30UoAvmtywIeG1/cPFdVPiG8MRXrIKC/QVBkwSXMCg+uxJjxH5U4NRjWES7
 AHH1fGzS7/LDh7qEfqiMcdpy9OULy+31GAU5xkT750qiLzVJS550a2kQVmOzPXzhQRnk
 yVq1rh6y8bF3c5Q5okF0Q6dhE1/NqFvkTt/MvdiIrqrl1c57US6HwEiICal9yuyTB9S8
 tkUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuh9MAn8VwrO6PpU8J8PXmSoL/Y2IIJCOQFqPQrntKvUCqb6QH3NJHchsJaw/oMNZCgBYYmoUjlrk=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIIMuSmjR70fHKMKecg/8+4SJ4oSlHv78PLZrAV5F0HIbZantk9
 NmJYhc4UPNWl7Ej/YvTWlNPZmb6qpiT1m++LiWyTJinMANiFqHNvBJWdbp/iUTnvcO49PvGstSn
 0yV9rEy7IN4RzV+aggqsdQMVFTUiHXRD6ZDj/beMk8YWWzF7jcqRSkawivtuwu1ftLPDrtbQ=
X-Gm-Gg: AYBFou2qKE2UgU7tdgZFcuMLfqH1/7PPSnO2twQsgscrhaMbzkZ53nQq+8EF/PsB6lz
 6Kza9ZvMltAZ8qvpxf4oYRJnHE97NRDFmCnKIiSDjXjHKEFN+Ywm3DbHQ2DIlH9CKVWI7AI+Tt2
 eMhKxNppOFxlKNGmqDAjojWjGwyAeVE4xDBx+NJDSswHBNyUvfxcEE8sodizsXQtcFjhdRRnzJS
 m2nMIbP+huF/e/aEt0REAIDOdrDTflHt59XSBu77F7IDbspsaMYa9E/yrVPQZWVOxbjBW0zyMqZ
 2Vj3csO47Yb8NdI3vP2PpXelaW++d0Te2vl9QgPJY1gwa+Pp01gMi6oGeRYbAhgdc4httrYZaqM
 ZsKKDA1nchV+j6jJt7c/9I+gA6/5YbZJa/iksZzht/n72HVzXlmVaVSrnSIqRmy2LJWErxKRKhL
 UWVL7sF8f8vrip
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id
 af79cd13be357-93f57d6fe0amr961378485a.0.1792675709059; 
 Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id
 af79cd13be357-93f57d6fe0amr961370785a.0.1792675708354; 
 Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:01 +0300
Subject: [PATCH v6 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mYaSuX40bR5awBoUJ+yVcQNZ86P8rY1ul9
 gx36R5zT7KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1b7VCACwuu0XJB0SDYYnJaMPkQQJp4epfFvL2A8BbhoeeUkJxhpxOVsnuymLALMdK9C5Zp+RGrT
 Q8yGJuTHbZI7/BlNrAHb4m9mYAyiPXPNVpLyMCrH4EMXs7axplxd3M7EKjQ6JFaodn/DBje5zAj
 z0TKPh/LAVBSLdkEHMBKS7r3xFwn8q5l9ktLyhrJW6u6JOEmW3xtka45Bs7qCgBHHkPqG/wGYEX
 BFb9KR4xW9M3ZEhiTatIIZofZV1DhBQqEa19haQvTXcaw0CRJrzm9fgsRGVTMdLYX0l9pAUBE3W
 jxJ3xlzvjy4cBPeL90Q4VfJZSVXoYFh+Ph2xeoq5YptpjfjC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UGxBxB8eAu4IhXj26wwSJ8O6l4y2yYPm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX7iprgRSv+9jh
 geekHdKqeYCLF7vmqthD2iEpz2E9r8z0X8hB9hU6n2eOQ0VZMDSkTB2T5YHPw9PRuHGkHPjLA4Z
 XXFhs3pL0cT+9IMDTpmAlHuo0TuX78s=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada0f7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UGxBxB8eAu4IhXj26wwSJ8O6l4y2yYPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX2HRMtG49365E
 IigPXI35x7rbBiRrcvmx3+rAefXl501lI8GiEVxjfzMe3raojHtnqDt5cvaoZSo37PUzpwA2Wxj
 OZSG0+RkVi1/QevmgVf21wKF3jbgIn02L8asDaS71eeeur2YAUTduIZkagoqAhAvQcVgsFeZdd8
 ykqK/AMS83aDwh7Bo6qi3jvTbDjJ4XrLlVCvj/eOwpiBy7OZanKOyGO8L952AVbjLWT6mobdANW
 5NqaDNfevJ4aW+pl0vveqzUoE8A/WOmC7svAmuym/mX2FM2uirMsQKNxgnqlzmV3aQ9G4Xh9vOy
 x3lqEn5MsnPpsCDt0RVFaPGWwobikOehkbKO9SnKld7sfIv7o2jju3Fv92/W7dt3yQV7iRTC3bq
 WP3V655/o2hmMe8mslVfZdG4bXSDw0qCe6qdf0B4OCOfYe/CzHjgeWTCu+bTS76FLgLeLI8ySUe
 EvxyhIrBCq31mRzfVTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

