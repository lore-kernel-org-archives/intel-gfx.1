Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD3606A327
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3UfktEy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2C7112631;
	Thu, 22 Oct 2026 13:28:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714B1112634
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA07f83115681
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=S8CFFZcnxeDjyDK1
 UwXDhjtwoydfibEOA/Mn/eW1A4RO4Pr+mu0hyxuCaGmWz4FprGpi537xk7D+7lOD
 Xi5/O/Kbs2KBWw7L22+eZ6uQ3mATsNLnea0xOvHYKKwAmLWFF67iNbWUtYK/6aAE
 unOPSH0GDvKZENAdw8T++m4rQbtFquVxKc+ig/v0qVsL1dMB4RsPjizf1KrrMnD8
 kuHxe+xZH3cmkyihrBHH1MgM5x8xILMTY5vfQWoSTQ7BoFHImmIQ9SNvuCu5nYZP
 FM9L0CjPSjYfCoMOpx8j/e3ZTTP34KuZrgrIJxeBojPyGeCoGerWfIPTKMJK1GkX
 vkdzXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e92aad34aso399970785a.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675711; x=1793280511;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
 b=D3UfktEyP0vZ9KXTH3ODgpPg8QMp1OVO/ENjAEyj+nUTvdEEvYU7sU6geFv0Ic7gnt
 Ng1X0OhtRn3+WC4466MP9n5vDIwVixJk8E7+R4S51HbIOrXW0ltEo5El07l/zH2g43CL
 71ptlIygkyngnFlW3i3cqNiLW+3ZDO1X2ZSQrMMLJuiHbpnG4rTFcEyvSdsM4/QLUD75
 ev690XqDMVh+GUL+yPy+v8IeBfyrXHB3fmN8ZzqbY3bYghhpfM507WoDn137zTtLa90b
 FcyRd5wgsuIFOWMEZSN4aZU6PWguSv+zq1BuwxedbNC3qwzqCGsk2YJQbox6SntyAJQt
 4M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675711; x=1793280511;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
 b=DiUYf09U1vScYfX+jUHpijerVXJM0TZ5QmSOdgNKZV4aOyc7ppMULHYZOAQFerq7Ov
 MsJi4JOA7QOC2yygLABcrLLF7El9jpnV+svsrc6VxwoPAEb6SSrHTW7Gm2Em40NZ+h8a
 olnbvq170cVqS+7lHsvVU3pdaIMPdOpTAQIRf86CqXRrXNT3QbsbkUICC2xZtfsCjfNp
 m4FMl4OL7Oj6LOmss12KabgVEOJqF8JAsynAGMh8DbzCl8s9SB+UtGtw8LlOsiNUy1hb
 PLv9e1BAx3Vr6HRYbIlzyzRLQmwGBCz2mBI/nBIjw3v46q9O+F7j0eDvuG2ZEEy6gVW+
 uzWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxR8jbMawoIMQ2KXjhrxmVzwcBMK7pX2MT6dtFCL0qCT4cgFx3IP+w+T1grehIhk91nbXoEbDAB6jo=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYId9EQZgVoofl3xZM6nxUuWRZV9bsCwX/rRwDgQe5VewgczY/vW
 JsoLUX50b5mwKDJFS/YbgnmPuCCOAq2XmBa2oMbJ8LVM11tu+9W1TSDz8W62ow1NEclsqmgj0Xg
 CFVPCB5rsGvxVRaV7SamhjxQsNNZLq2i8jZTB2XTK7qZ9Gn7yNW7/KeEYlk9y4louA7HrJPY=
X-Gm-Gg: AYBFou3sRuFmlmQub3QYrI/iQrcE2rYpN5G5hzaW0SVbUv939vY2qRiDh2FPpP06QTq
 Wz/VNIob/DiKnhrTzJOvjn05XvjSGa/8x+lzweFUGov2DPrx1UbrVs2Cd/lhr3//747XTmpLEIB
 BM0sGxWLNj3H+g1IgUw84ZGA4RUs325HGuXmQKAud44jX5tdY3HDyF0ySuaNlAT7XyuG3lE43ON
 Yi6UDINZ1AyYP1Uu4/XqyYzW2Zs0jKf3mt9+3UkOL2RUf5HKGQzywnEUjavK5W0dqfUY0O8VOJy
 wVxyIso06qygJkPuU5Ml+1wouxjPqNuX2BpHsCCboB74CceGic82mmjIrwXfJPUBRXd0NE2Bn84
 ZcEpZFHS6uAtNywub8CVMI2VedlyOH+A39rUNrabhhmy2IMqz++v3Zr49p00URRxr9TQTFwdV0R
 7t3qMYPbRzYkvu
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f57f1d8f7mr941933485a.45.1792675710972; 
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f57f1d8f7mr941924685a.45.1792675710367; 
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:02 +0300
Subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XbnsZm7/G9+6/HZ+XJTOjbptEIAHWIuqiD02f+/AGHg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/vTwOk7t+tp5eoZf2Nf+emM0WXT7iVln2H3mOSzik
 TlX3Z/VyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJnGXkYFjHcl3xl82uvyJ3
 Wp9cXbxrJf/3zrq8wjf81TlV3SGbf9ad392vEaD009si5p+8ZUtBbJPTS4WU/622FvemV++LEjx
 sk3bS7/IxR89aqcQM9cmli4ourm/5eJx5v38RT4Sia+1mHV6tGYuXPt8k8GsK+1QTP+lMkSITM+
 /1Roekl+ucltlmGrnP+aN0iaXg+cdu78w3NHq9669bFx0QcnrZ+40Lt77a97OiX+qhvqUmd58hV
 25yjPmeUnaH5Wt/sX3xmq6k9XlukvCCNSpJ29pONM/SSZdd6LA+zKZM/L7zhwXnix2P5GxKO2zF
 nBgeGdORydXzLuLOpYq1z5yZLjRdlJe4airS/IH/0o8iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX+sGzF/ZBILUr
 lz8AA6cx1jUWoe75QSqOhWoO5GtZMlrwHHBofF6bIA4SWLvw1GhV0GkRCkHPjtV65yeuEY2ctUv
 b8k6FmL67u9MvcIOSryhNsE1V8K+7HA=
X-Proofpoint-GUID: Sg-meGLTtO0qN2jhnoayrpUL5kgIP0al
X-Proofpoint-ORIG-GUID: Sg-meGLTtO0qN2jhnoayrpUL5kgIP0al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0KqTT5lcrMon
 1+Xq/7hiWfJsTTZT8AhravdDLtA/H/BmzATe1mi1CqqQXLQKVkvFJXUyzC6gU7mQkvqcNxnUOtm
 eLwr8TpbiNLsNpWFUqZcyZ3UXbWFAQcKVgU1pXoqgt5z7ya6SxkU0JWgnAeigX6TU5iEUvVT59r
 sH/YwYOHNGX2KIIQTde/5/mVupm8/RwriXs5RWyyV17ZbZcbfCrVULt0+kJeh6uFFaJB2HX/7CN
 VQCx9L7rUJZ4GufVBpEwtUfEtsh319qNZCg/yqaBLdWxT5SDUWY58aYSGPJjtoBZWY+Y3exPs53
 +Gsmvb+XS5V7+d5CkG3wB7rO3l6moZmiY3onklvY46i47suf0hUCkJtXy9tDo3tmeaqaIHGvFvZ
 VSf+bZ55f8RMpOqwQOXEypKE0m1Miw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
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
index ce919a26fba2..6a8b3b8e1fe7 100644
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
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

