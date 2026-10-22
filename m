Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE28E606A31A
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fe5Ip+Dk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF5411260B;
	Thu, 22 Oct 2026 13:10:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCBD112617
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:10:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA09a92918682
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X71VhERMLk9X4yX6oZKoIWZ1
 HUd6drCTkrXIPj5i+40=; b=h4kWjHHp2vQbs7FvHIG3d+zB/9hpThcUAdfi//Kx
 lHQMH9vEM6g/E9b9N2pDrJHNk9G6T90OAYdz8+F60MgY8MuMvPr8nDZhP5eTUl9i
 6oV5tW4+SUoYgUfJuoKQfOHAUv8avm3bVlcT8Z5vH54BGXzunjNOP7P7M9XndaJW
 4R0L6fjgA+khWUgH2DNpSbkAZ2TPpTjXJde1dzqTXIR+wowz5sSREPa7jtRjbkVr
 3wUhdECgFAlstvlduFnVdLXEILlECEh5HeObxXyF7MqoiGvDisCB4QTYknJ0I7l7
 nN9QjCi0F9HwgoaFPKjvmTcdjTU4Z5YuOEl8MS6yteLb1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93abjkk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:10:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f13c143c8so343837485a.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792674600; x=1793279400;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
 b=fe5Ip+DknLeyaUcyHIC1o35DQivPfx1k+3aNcmTx4rEMM8j0Onjj/ZQLoTmdpqTcCl
 mHE7k5WsTlOqpEbTOG7VjaBwxqUArZ4v4MIPq96hkQHseYFJ10k1NPm46xVDRBXQdZwi
 XEkyFcuEt+Md1oaz53bQjdeWsP+E3JeKEfKtseLBGxN1kiTBH8EYV1tXMSkgmennzywr
 aQM+aAn7hEnDT5sR0Dz/h9rmIWrMVdBnp/XBWUtB2DZmIrQ099KtyuWmTzhxq2lbLxhg
 Vc6k5BHtIUDpzvLU2/ZX/GXEKt1dXPcw7CITnpfI52/xM5tED8WUhfOzUqRIYs5UNklF
 AwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792674600; x=1793279400;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
 b=CfUP8x2ee9CuYyWMuoOOEGqe99W5yEKIcEjquEUgDPcMHtni4TAjPWU5K5cwFyAuMN
 EdzsXMvQHkxRx4lBVX+zGwZ06voGOmb9/5vKDsy1Jf2f1qPK2PrThjV6juxUnmsZlzfW
 os1pLk7NCZQh8FRQpC0mbtdNSbS1+YRWDQlCEF1YnFrxKgd3TJwKU9lSeMaHwB3qkwWY
 GjZevRTvAEmGRDxGBBPTGVNFsir5v6FIiA0JvYDT35d1Cif4oCxBo1M12DhF2qYdLQsA
 4vcD/V2pgeOK3xrYci2HSKeL/cERmB+PuuDLHCz7V0EF0kJWKPjU2ewodK6kxRxQifnn
 OUrg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwj61uir0CyL4P0cDeeAbfMJFkLMT9bajx6QxjX2QzpcdKBR9QIjHYW79/YsKrI0T/Im1hyXrDbGoQ=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLrbZd+Y3r5UGCWjUcZIGhJUMDGcmfeqYr3/woiBOpEUMHvEVNz
 mf26ZN3oBaItVhhywwDTMfgkvrbxHiTtcAUFwk7QwZwEGJOaB/b9UGBIvK/6sfcot7i4297NGep
 WYVZSW9HhxsihF12qFUHA2EUtTkLhkZJvE47GigREG7NlioSp8UnbmHjOUA6BAxIlWxBSB20=
X-Gm-Gg: AYBFou33VJtyA/5tS/qS3V5WlTlVXAitFnKNvselmervt77/G8/j8Hp1R0WqK531lc/
 1Vli98gvAy2abhqKgVyG6OfCjDtMYnrEpksbYm4Expe3SJlFhA2kdeSQ6N8+XfqqK8qpzSj76zC
 JMWczrRzw88rM0RqtpTi+Qars3eCJb8VgQzMXo8PtF/OE0agXfSw9oe+HbJZjb89e444TyjzbSu
 j44gOchGQx9gUJ938Fh2yJHpwVPjbiS3OPZV4fnE5b0pW5OdPEqzkfkc+P3kAQFk9pmZXTM8/+Y
 LDw5xFKXO8EaJ1g812Z3svOlnDRhO+jYXPC8Mk/go8taI1sAHiLqXcWOSEesPZZX10zTvxfkLd2
 /BoSfI4E+0NX178m1M1qCZIZBK/QjdL5BK5pgQCostoO1yJfm7JQUklCo6kqYYErsxuOCWDZMME
 pvoW/kLUXNxJSr
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id
 af79cd13be357-93f57e5e1dfmr891282785a.10.1792674600175; 
 Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id
 af79cd13be357-93f57e5e1dfmr891275485a.10.1792674599660; 
 Thu, 22 Oct 2026 06:09:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bfa1b94eb2sm1024058e87.45.2026.10.22.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:09:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:09:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Message-ID: <mdmxy4u5vz7xt6e524l3ghcy7b7yx63lirrnk4s7qzs4pm3oti@wucyw3rgooyk>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
 <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ada0b29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=qswy0Ei35aWKpRDCTP8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bKk2XCwex2dw3NAf2sC5MVkEUdrcon9k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX/dhnO1zAiDSq
 CjxPdbU8AXCJLgPPt1roG5sOWZ+kS3N6FUevpcMo/uD+Wt2SciSj/P4ZBX2J7vWn29ZAuKp5Bf+
 C5j5ZY64eID6FzTN/5KBCsl3MxAO9k8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX1EsQHSOH0dI1
 aEmBM9aDg3H/kDtx2vFc/xtEAnAVkBUkGfAN4M/pKTJ39PbOmizKDDt5dytTSW5RQw1RtXM6DSn
 UksrRLiEA6r5wNGXdxa7fKQ3YhB1Vh6MSDRsytOrvWn+bnj0RuQYE9jAbOi8Q/u7WBlKjF5fi64
 nDa8/yGCg4b4n7GkQxJ4UBW9q59lRck0NWXF6suDf3BqBmMZyLl0VSQ4qolAYFErKcpGkNw9ZSa
 toHQszCBdr4CcDVXiTnszq+5Ho5hJvRHxol9urQhyKUnPRHbOTZVNDyVnffuEcLdebs5HI5/XUn
 /VbFPhde6FyhahcQUTx0A3b6Zju7lOOAhL8Ph4Qa7nKZNRZ2sPawmzx8i5M/BpAmUo7L3XvJOzp
 gfK/OoVIcQ3c74ucJzw5zM7EJmBjH6dPA0Wjbdyvw95OrF/xIrE9D8UWGj+CzWdvtPoZynypfDl
 xDOYykD2JU1R92AXO5A==
X-Proofpoint-GUID: bKk2XCwex2dw3NAf2sC5MVkEUdrcon9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220052
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Sep 21, 2026 at 09:53:12AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/20/2026 11:01 PM, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> > 
> > Extend drm_connector_funcs::oob_hotplug_event() to pass the
> > notifications about the IRQ_HPD events down to the individual drivers,
> > letting them handle those as required.
> > 
> > Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
> >  drivers/gpu/drm/drm_connector.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
> >  include/drm/drm_connector.h                    |  3 ++-
> >  4 files changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 00feb73e63d7..a51567d19550 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -141,7 +141,8 @@ struct drm_bridge_connector {
> >   */
> >  
> >  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> > -					    enum drm_connector_status status)
> > +					    enum drm_connector_status status,
> > +					    enum drm_connector_dp_event event)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> > @@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> >  }
> >  
> 
> It looks like you only changed the function signature. 
> Don't the "bridge->funcs->hpd_notify" inside this function need to pass the event?

This is being handled in one of the next patches. Indeed, maybe I should
squash the patch into this one.

> 
> 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
> 		if (bridge->funcs->hpd_notify)
> 			bridge->funcs->hpd_notify(bridge, connector, status);
> 	}
> 
> 

-- 
With best wishes
Dmitry
