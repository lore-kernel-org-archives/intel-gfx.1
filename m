Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18E606A31B
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y14TJ8rP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjNeztvE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF69112D68;
	Sat, 24 Oct 2026 00:36:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB90112D70
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLuqok877067
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Y14TJ8rPPToVsOWN
 sBACVXmoasoTJ1BEh5WlrsTucN8+1iRREOVjNrczmobmXxX5oiHYgEGzAQr1iMyM
 u5Nmjq7B2l7gEH3SnQGc/rouMMU5Q23+5/UE0ZDYEwq/XfSNGVYHXWOKX+fISFHO
 6W211gF2HF2lAK6Bq48wtp/cS0JAVlUuak8V7GJ2ouXGjS5/uyLvqZWVgdu3UfhZ
 a0uyVvXiWUfsftHz14XyjlthFB505NTFdrw0dmbMhYjclSTC9VC2Gkk/5RUisOde
 /VquLCadl8Ru2Bli0RFKlPMToXYWy2PjslbH4K3u9hm5C8dQrp7Lv9DEDD3Xhi1r
 oNfPaQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr691kk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so30681796d6.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802171; x=1793406971;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=YjNeztvEDQU9albbGQl1mr9xd3Ff7zu9ba2ItdgqXPBxlR551f5X6JpNGdnpxLonfC
 L7tzw/OsROdIi5h+C2qRw1oswWv/23FYhnC/u3D/oqDiRBjw/wkDZHeCJn3b1zu+OfIt
 BXrE2uos4RjLXRLD55G5TiAOFgkD+qdvqlnvTa/9hxvsPip0b6cy7+pk99mF06AE57IO
 e5xvUt2Xc15deEyZ5Kq0331ZBxqEuCoqAxCD+wUEvWwS3u4foHyIkmYlmxQ2+5Oys4NS
 eno8cS0KO5Aroh+tg3JddB88s/RvGcZepMUVGI2iFdDLVij8tjq1tU6NE1w2/3VP+Enc
 7RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802171; x=1793406971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=qy5nQU3lbULGpn497IANEpGQl2zeNbUB9Nem3ayIWpUkINE/dk1MRQpG/NEXD6LhIp
 BmsLOpDAG5jemmTP48nrAtyN2XzTWdP6qcCedEOBSsQEs3OlRwovHWXGYJJzVgIx/Y+3
 d6zjzhBpfEYwnYPdIGe1rXEs7smWCnLdjOLNaMBgRUulEgHP8UZ0fenWam/eGzcGNV7U
 sfmHjxZ2jTIsa23gHvnIrY7hdF1NDI6LrzYhSzDyKbddRVBRgBMN63KM0yJq+xyrHSQM
 b6ewkOE87Jwg6WYqwo3DI/R/p4YhWlxaz34+2xAmQgsyMBSE65Owj+w0kNLxc8zCtj/t
 /zCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBygDKUpRWoW8fstVHweaVxWAnYTGoIpgj55EGgiHd2BGgAGuHo15CDQNRRuc3GrXTNnLdzpiiLhwK8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJCQDgVl5+w+0M9LNLKqDuslULEYYCHR5f+jB7yHhFSVP3KOg4k
 U9MuRDYoRM/H1H2ojBuKPmtkMOLNkCnTkRzg3LanAgsjRY/R/ZlwSutxpHoKvqYww/9FUKzmnYy
 544R4XUqr1jGY8RmAiWt8LZMNdOlsrEYwh0T4+tEFktmJbdQ1xeDlAyg3jPo5/rjtrqnCH3c=
X-Gm-Gg: AYBFou2gWQ3d+xZfCGrBx6FxWL2kt5FzF5xCUminbgtT4BMuvUQsfTWtUITmLiofWKA
 czNgG46r3LUtMu/xlA4qfi43RU4kwgrDhLZGO1DWXa/GLlLDtShiy68k+B0wkV+qX9uPzxHKsYh
 hJbGgUfZpmGRSJ/7TudbDRHPMPyH0/CwPj/WD7JRwKLuA8F2zUXkgOEn3Z1cQQ+dGgtN7hcH3qb
 qDxWfrwjjPL0GR8l+5E6LKK8TjbMYSxY1xGqH+X5vXMuMmhnG1by9fx6hQEpzNp/MrZbBMKdJmB
 +xrapHlUoZvYc+odrG2QH0wJVisIp0rZ7epFw+UpmuSpQMZWknGnO83A/E07JZfxZv7mstDXKwb
 RPmH4zngQsGrpT8BvV7VM8Ix7rrsTurH+AnTX5SmI0FHOVVKUBf8q1ICQA17/EeK1Dm1RAkgXSf
 DuWwaYrC6kSEz5
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id
 af79cd13be357-940ef92acd1mr116217785a.58.1792802170910; 
 Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id
 af79cd13be357-940ef92acd1mr116214485a.58.1792802170444; 
 Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:36:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:24 +0300
Subject: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9btvyFFnqxLn4beuyZo1X0kPkzxT7j+V+WX3wPT+pKeT
 63zd1PsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEMprY/zt1hWckG0xdONPL
 Z4HYo4JG+c0LTsazGwSXB27eVK1/9LVac+vheX7Tem0dWZwOtG+6t0xbSqdF6d2X1sKZ/Amhk8/
 0dJ+MtVES2CfvLHK4ZLXWvR97hDoFdjh75+zr6Xx7PKvhlZjVSa1jYtYf8t+cY+K7kJVi0GZo4/
 GyvP/hoZdb1nVNjXbazZJ4XWun5mYxn+4sxd1i207MkZ4uEGnY9zRlpWON3CNz1Tn2mub5kkIlA
 o43lQRXPf4kK18/OX7r2Tvz1Fo44l2aMs/t1rHi+jY7PC3KQOT4xIiNk1LqeTZYbo/iEkvxenuw
 9vZhBqnHvLdO8a1UV4h5WZP/IWeV5vHwc5dC7jRK5ewHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbfd7c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0Ix943pUmOwN
 UV5scygf5sVb0KjzNbDrTNyAn4NiVeqnRB9ZD+MaPU4etvTx6UHOz301qx4Wdao0HJq/QCgZBOA
 +W9WbpPtllQY4Kz1iOKMhFiNCvTb8BkJdASBnU7n+7JhxNwPFzyQVRPZokrQN9IrJ3zC6wPNy6E
 gqZ6YO13d3aBxgxFPv/+6yAS++bfJPRab1bVfUeXdsQMR90tP0d1cz7DjJm5fkZ4ij1UdLs7UHU
 kLLUyE7B87nbQhVTNX+1pYjBCs6e+EzvfZRf2zfbc8pjSO2hOuPn5yIAAz1FwPij+GlLlYe4mu4
 a43EoMcmpTB6A9CbWFC8wtf402jE8ghVRUGrPj1xcGSXvCXSH6vf/RnKMw63McymjmAe1JjmUxV
 xPR4zYyPbbNKUxiVGxcvTGC7xwrXMQgYX5j4re0z1V5WzPye21hthJmyJZZsoI6YIdNMYxuk5U+
 3+zvxtkxk+yMM8OIsXQ==
X-Proofpoint-ORIG-GUID: mep9HCM5z9jLnsndeGelM0yfAf6NXKaQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX6ZlnAwDQjwM5
 bAQrRhK2TWuLouzMi+uIk+x2vGXU6v8RHg6IaUNaaf5M1IoevzG43pnLifMMxgxzwryhajDL76x
 ZCS+5HPZ8iIDEYupalm5ycoCot0qGK4=
X-Proofpoint-GUID: mep9HCM5z9jLnsndeGelM0yfAf6NXKaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

