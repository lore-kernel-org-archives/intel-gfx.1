Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0925606A31B
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFXfKm2c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C471A10E899;
	Thu,  5 Nov 2026 13:35:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CBC10E1C0
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2026 13:35:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5B3Le53193493
 for <intel-gfx@lists.freedesktop.org>; Thu, 5 Nov 2026 13:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
 7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
 Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
 TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
 E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
 HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
 aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrmx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cbf2fd504so370350885a.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
 b=JFXfKm2caeL45rU6qXn/1/q2iRxI/Lv3cIwEyDz3MiMjfaGBh4OMIzsxra8ES0Ce0A
 W5mEcwr+0j9LCE/Ecee4wsbZXN/8KKfLaeZxXUAfDMsEag0O6F7RELOsg/iCHPr7wNUS
 VAEOw9hk6j8+8AugyMBf7LdPrdYIWDEDW9JQmlAMOVxPA6PtebIqCdzUeaJNDA3XW6ae
 MPOZb8jO7F1J4VoP+FZ+zSrgqwOW3o5/NFBFZxdZfTnh3r1J4eTTGy9V5V8KOWGmZ+Tj
 QYZVXwVIxe2ECy7kt2uWZBe1EnHq2rOHxckMgy/pIhIV+5ToIHKELm81/x4vINU+iqV7
 dO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793885708; x=1794490508;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
 b=iiisFxmFUqQqNXnV8Z7IoPl43pYFNUYBFBKxGRkhc6kEPJ0COPAQnBZoOmhqQDSFfT
 4aKXCugUe2p6nOXyZfVL7rDeu967EoXBJ+2pBnqs/tB5wZlxyQvb/FhT7kFxtbIkXjY+
 6STgHO+kUP2zh3B1X3n8Khd9iNUZv3tnOjX39HrujIT17K7AxQkVXL1OYhN1FdSZIqE/
 Dlwh+2l/qsv6kRRuK4Ctb9qlqrONagSxLFmupAu0oWWlh88cInL6q3FRBMhvTOyHnEAO
 8eYNfl0vettHZNsuuLQDd0wDlbbVbx/UEzMOQu3GR1mDnqp2HhhTiS/WZQRwslY3ANPe
 nldQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6XCwusgyUaUaDV+0amoAcJGRWh2LgGPHz4sy1zVpKe92/QHR9yuu8sZ/JOXZiWD2oqgDZCBmH/mc=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Oc4n0H/egpH8XQQtzNoorSzNXOAN/eVcPpE9XpNqUdPsbE046
 UHqILAmgQIqc0uLGi6Bfujd8zVyDYS0nv5qXTF0ucjKJmC9VEBq/9qcHaq4rOKVb/MgzWYM5Rl5
 klEGj4fGksCM8BIX2o3MuYAh2Tt7rFlawlEpnbe2xeGlRzFVBmUkKEcJiI3LpqpsanmhzBvI=
X-Gm-Gg: AYBFou1qjEAemKAKylhMr0Ek0mB5zRVXuy7nfivezAT84MQ5oJSwClcvYtdHEB7wh47
 NU+d4KpY+hBcu3qGFEyIaNZrMv54BRsBLDknpRr9gQyU81NE8ql93WZBGQzOOvVxbl0S4MMInCK
 BmNmr2TdiYeoLNTAjtNODCkEVgXCSx2zmXmVOwT3MVD806LbMlWBe5Ckiv0fU5jkmg5iGkFmD+G
 nrCdcA6y6kZfLEUj6hQIK13qkz1xK0f4jPGIb3yhpvwBYlK9jbqxFgAg+VrXdHgLxVskg9BXXJJ
 QzKT3RoARfF2WDzU7uYGJZ/UEFEBpSG7fiIzR+jioJQ662r/USA2To0zcmskdhqnR2nVGpYPI/0
 R+HSYLabMlJzYRtgeFIBXHDyJxYDvvI7si/0/i3ZkkRuB7AkcQM5JN1OU2Uh1VlfgQ0/RhgMBTz
 Jysol/o9pxNp+aO+bxgqxsAxQaWdGDZXvOmzvaUmYhLsa2KFP4JPZGJgTMyJKy
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id
 af79cd13be357-945b9c8dedbmr1578449185a.20.1793885707639; 
 Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id
 af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078; 
 Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: fWrjSec9GvJivRewo_p30GPyfcw2Nn5b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXy5zzUvMjVxbj
 dpWcNlHXZKOhUOFbsz5nyEPqQF0yVcKWkKKvCIFRgfdYHmWSzNsv+B2601GDzhldGGaBNURz6ip
 dcchZJCZT8+8S4tOVcJ3B3PpawOjvfs=
X-Proofpoint-GUID: fWrjSec9GvJivRewo_p30GPyfcw2Nn5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX9G2xuuGeluYD
 JqqKB343rQOev0zY3yfDLTNbCBP1UeQDIEYJh/SPHQgBfVhP9rDs3BuJQ8yX83J+zaeHeIQKaDA
 0ggyFySY6rSMwMLfMsbXrCZsrHb+C8z6rcy3ZU4eTbaRBbVeRrmoloikUQmAZTVbJtXD+GltJON
 x6bFzD9tvI7n1rPbzhd3rrrNujY22lEJcmIaXSeYy0Ivm9X8FFkqCRFf3XuF2qReHhcU+F71nvS
 dxRrzIxmqG4+ejkKLD0raVHdGnZtuoxD5YSl+eUS7rRtB9tij5zfYO6FR+x6g6PtZUgnx9wroTf
 ybTnw4mzcaw1lxpnT8cSfWRdSiR7B35g/HfbcsiyCuIeETugEoKanjG+0bRn5W3xi+SLZGncF5o
 y6Xt238vwRegXEWHBzoyPzHeaFPotabOgCcgIOSzT+sKT0rmjj0NMDO1+JJZm6h5t8JvhjbThK9
 ry2knZe+UabxzKQIIJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry
