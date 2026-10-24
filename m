Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72A606A324
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+YPz7wc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5BKmIqQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84C112D61;
	Sat, 24 Oct 2026 00:36:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951F112D65
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLvcRo3471165
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=J+YPz7wc/wXRkN2O
 /qWs+ZbaVilBwmcQTJyrbtXOAeMqeThtKiRXpi4A/NpM8tAXAc1U6YA24zFappTG
 bKsKyvIkjuaE1Gq6B/vMTXO/NEk0pHqrpsBKxIYGEyYk9RVRD4HIy6p0CWdtHCK6
 H2STkgeyyPB0upr3Si9ydSXMkI/dXDeh4B3IUEWh5bCCMJ58fNxx7BhZ10zn3WN1
 K1Gvsm21yU02e4FWnNrxnU0rQWO/05YbtIAhZqAwLCGHCJXdzi6c9yl+eXZJJlNE
 tr54sLbbaRhNODu2ut6tn/EVi7L4FyqYVs3/TqK8bHUMqkMVeqzgTTGMoAcTdbLf
 c7youA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcruh13a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ce7a85f04so287814885a.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802167; x=1793406967;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
 b=O5BKmIqQHaC/+jXIe+SUcap36usQibnO+2YQ/3jhkrwhGYD/x1Vj5/yFq1eiFXaLSv
 RYNrpSNMewmJR3DHMihOBysU71WcMWbdfrnHlQn0xIubVWdb0/NybI9fAId9jHRjClkQ
 R7O2u0xnx/HFjtIvzF24eBN7T9ugEqETF21XCAIY7mdLDp+S1dVb8D05hPOpuiRZL9zq
 BjtZEOJpCYHtF8zhOA6TjDmGuzxXcZnhb/+TMzNtYjOR8RAYsMSos1tCeoKcbXG96LCf
 NDzX8T+1MwZBDiTTROaSW28fFuWoe9HBVC35IwfAbTB78dFJzk4Q6bBMpEpyBjbwE+CW
 /r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802167; x=1793406967;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
 b=1yHe1SkmjsrjtXx13h6A08QPKzbb0PTAdJdCOIhA4/995pXmqtUFx4de4YiM0vkqxj
 Wky63eL+Swp+OocR+YJ2nWeX/bma1wh8U7agGmLhNclDfD92yRNgUMJ5GA4sxpoGuVk5
 jK08Hc35CeFEV1BzzxKJKjrdgGNWjQu0KXIDMJLvUkqSoOggDOoRWuIfIURjq2Mllf5P
 SjGUo+LkItq4jbbK0Y57ahDBGDa3lnYoU+zKnIZLxa9jCbpxco91FoecAKjVyNBGnLC0
 eQkmacBnN41fZVQhIHJsJQvRxIMMgARGrG7aW0fvzEABdQcwbZ92X6/9e4YHNRmpUYEy
 H2BA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzH61w1bN675XncqWDcluVkx1xgaTxFOTP4h+5J48HYTQ593FnfBRKlQaa0S2U6FmltKBl9dWeIf2I=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLk/xMfcXP6fo3ZmUzWtDhjXbNW9q8wWc+6IqdZAXW20PElk3jl
 EQE7pxscID4ksxFl67nV4p85MFmYkdH9kej5SG4Qmg1Unt2odsfjBhwWqi9Bb6MbJZLS8oXg9dO
 RhtErzchk28DD6noSvqo+zBUctvNjNXYLSlnV92jWaExLarNmzCuJ3qiMpv7QDmqihi9Fqho=
X-Gm-Gg: AYBFou1SEeJxkFAMTYz2qai51L8rc0xKD8yLPjpoqMPdcFMLd+qcsuOSAbhnElaUdqi
 QlybgCh26eMKv68grbdkgBNqAdXQ5rsgPYflSopMdO+9WDNN2nnefOOuhtavgArOgFnVPgLFZvu
 liwV59mVLTLKEFdsLn/ixe6A/YBH1Y7DlLC76mYwFFKMiLby5KyYpfczehkkMGm8KDvAVDhBhip
 l4TiiZ4Wa8FY/aS08NP0KRELxX5979u81UmIA51mEtaAybXS/Y6xTexUMC9XBnJTEkwA/2+m+1r
 YdjpCnMkT4oBQ8XYbKpdrW+2UM8dTm0fKUb3Ydzti3Ugj2Sslua3hUWJKpusZ8AQFe10NXDSjxZ
 y5gq5xKteikCi4PzYV89Fgu3PPsVsFilqYTVNpXTio7asv2hjRFazm66n2ywCbxWDRDYfZf+Mm3
 wI7vS4ZauV/OG1
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id
 af79cd13be357-940ef8fcd84mr106705585a.13.1792802166942; 
 Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id
 af79cd13be357-940ef8fcd84mr106702085a.13.1792802166482; 
 Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:23 +0300
Subject: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrb/VOgyI5r3WOrGPADO8HFThBlFhdMoyLUc5IOFOCCd8lmb
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq2/1TAAoJEIs8ij4CKSjVSokIAImr
 d3EvdLukc5qeDThRl7OAYBd5sCyOGRgGJL6gPmPsMCQlaqA93SbRaQdlHe/asMr+X2+Ui1YaSsV
 p8LZ23dmV2u2mnN+losDIcIObjYElFx1HQ6t5jidjTnjJ/unIFs9t1Le2OpxFbVvMMQnLGwcIhF
 jjwaHFiOj0BjokPIcjsvIS6tvO4oQVhK5OVnfj6nydXw/yPBrEPzUPmIYjC6CFMhj/XTSPvuKxP
 6JMXu/3eauaK8fpauY4Zh6nm1kkX0hdR1EAo/6ma3QdCG+B7ADcQbuwzaK25hzzFs8wb/qCqrLQ
 VUYUwhy9q+KulXT735Z2FSv+NPcOe77FBV+4mBY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX8Bbv+L1w1o3x
 f6AMJ16Ju7Dti5YB63MNbiBFd/LflgO9tLvLNGUfF9YIyJQT2JDWsPZ8N+JzkvRJi11R9DwaTBJ
 8P7i9XFIwuSo/WCdop4liVubnDT+Xbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0mL7dzHRe0zT
 NwkqHT1ogBqSIojCfpmeyTu71nR/YfVhf2MDPMLYom/bvFcOZO/txulewiSpHE28iX9Whfn9Mt9
 XZ8Woy2GSDiLMBiUEQH0n6szKzECbAZMTsv5o3njTBBZLwR7ECMq+dri4l3ELZCxczgxSgYUpfe
 OXZW0IqSjxj1h5C96QQnjArpOtTUVG/IlNR+/VOidLV5KCAn+elJLduqL8lI766yUJxKyvekJfU
 Ch5AAnTt5mfR6F7AgLlMl78guS2WSybQv3kOjxsRGgyMUhEYoez4DESUbrCa6EQ0+NYUP9OK+Bf
 eCXJjIFcdu9n7gXxVF1vqO7Tkj6OxwxkQNhVOKRmhLj3kP4n7aPlWDZbTyyRTw2OnCs1Pg14B+L
 EYEI6drFtC4YYNAKbyarHPmaC7VuaOgp9IDDVfIjFxCOcJnOCbuzEsDPoObJhhxuen+JnF6M4wA
 zlKBfJqU82upsRi3Bfw==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbfd77 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ld3mOZmX-1C4TVXranCTGszZYALn3FMm
X-Proofpoint-ORIG-GUID: ld3mOZmX-1C4TVXranCTGszZYALn3FMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

