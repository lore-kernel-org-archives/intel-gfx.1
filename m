Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FD60A2605
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=V4Qa2C2z;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1KRXhNcE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F4A10EDB0;
	Mon,  2 Nov 2026 12:42:47 +0000 (UTC)
X-Greylist: delayed 1204 seconds by postgrey-1.36 at gabe;
 Thu, 29 Oct 2026 14:07:16 UTC
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E1D112319
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 14:07:16 +0000 (UTC)
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TDFwDN2771038
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 09:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=pps01; bh=LzaYibF6mNyyGAG
 yvN+zjBCsoGvCNikDa8hZ39a+8Fg=; b=V4Qa2C2zvxI3eZn1CBiQ0Ki/7SJ/rXC
 +FHqNzyzDmtqMKO4cHIn0n2+7gF3bShIaqq4UJg6lWju5GBFofRf/DN/tdKfRsfg
 6f8pj+9LH53i3uNQB28bX0qBkPcie3eH4T7Zyj7hPrX86B0BQ6LnnDuHGH6wtEyO
 2x786dSnO8t5JhTkO/xHfX5c1QWWnG03iVtBEgaoTlycvp7WostUlnM2iavifmLe
 nYniVw9Ae88PnAC8Hu1rhfScswKvZxmrV9e/rcIfqiRTTWGfT4EjD+3gPFcjc6gT
 g/lIa88ZR9GUnxKhiV90B9BqIJ0biH1ZbaolFXuDbNza9PrEBNDvOKg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hkqfrn0df-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 09:47:11 -0400 (EDT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-99081ea787eso1648823241.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1793281631; x=1793886431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LzaYibF6mNyyGAGyvN+zjBCsoGvCNikDa8hZ39a+8Fg=;
 b=1KRXhNcEPVuh/oPXCOQACcyrRAKafXTji1YiusaPe/qLI7IZ/2vE1JiKaXrq8C3OIb
 Q+vS9MqNFF0CKYdMOhuB+FLozjKHLDGppwMECrUuah9JYT8m3zqonvQh0eJwMPWt1EIh
 WrPc+TtXw6GdlmdOu/eWMwjZ7pi7eB3JYanY0zIRcp7amosBT0JSPO8i6hbG9JyTUA51
 SOYZR7iLlWrr8Kpt00ZbsaY4EdAulBHURbbNyEw7zbm/Z4/XBOieKS1rdDWRJuxERJf/
 9daXtRzsAyjGJacXYc1nQ2O2jPocvXSva28FIiQohDe2SQ63wlrDlbPDW490KnVwu287
 d2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793281631; x=1793886431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LzaYibF6mNyyGAGyvN+zjBCsoGvCNikDa8hZ39a+8Fg=;
 b=F1LZqwqvD8dK8qDmuRx4FCihbwHHOTcjiwYkG3oqgBaCyeed9x9/PMCeAfiT7ycDsn
 R1clHlClXIzdrefCcvNsNaUkE0uz5rOEF0kudwOFEXA7YhiHTS7YFWaTtW2wr/oaWlPn
 9z9zRsy/QwJ+zPWIzlA2bdvUtGOrHB8eOV//nA44pIwNIOCh6BbBW0+4EpMCIIPqEv41
 WXomHIKNRSOYFq1ovNff3RSb2he/GonxmUXTlAsATMX+r7LCEHsFt3CVyG0C+qrjI2ea
 WvJMbNMfeU0ihA6zRT+3SBbcN3RWH512B6hjDiDzWoMwoS6cBwFdAzdg9gNcCrn39NbS
 Bdow==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3X4ugn3D/TvXtNH9qmyrYIJJpaMvnwYtUbeC6thxSJ6+fPn1+GS1yaz9VkXRDXszP5FKz4Z5JxgM=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKzwOHVGakraiu/YlJDEXokhprgp2W9ZtcFUJLUNWMFQi8SvekQ
 v84WPMMJzQ4tlKQoE8xhNl/7IRxIou51hp6VZ3WaAN0GQG914cI8D8auKRqMfmEOBQdrg23swrH
 Crz5gwhWcPifQVVl4q1nXpPmxEdBj2dKSnrDxXNXqZlTGZU5InCa6qzcsHuymTMRXwQ==
X-Gm-Gg: AYBFou1UwVw7Xe2aTVDK7OMByHsN6hCeJsK1Awz4CDGhJe8aUHmg0Rk7YCXN3jCV+Dn
 U4qVz1G0vm0JbSKiefEj/7K6xsOkA8RAFxKBKS82pDRXV63ajxlZjDZPEOWJTXaLi+E0TWqjuq0
 DiCEBVgr/Z3tlZP//W9Ja2YHf/akzwdgMHNFnMTo9JUEMmWIsA5qkAbyTOHbmGXR6+vjFypS1Tt
 SoL8Uhp7D838YO4Q6n5cDh+ft9tPsxIJdEv+ErgYMsOJmaTsWg2cMdWI9m0FOj0+cr0MAq7XQPY
 KZ+xHWiQ2aqz2jKdLQa7YIVehQsT92yk30smzTjajQ4U4pgHVR0QjJqv1ylRULH4svUYNC5Q0JP
 ehZEVEP1ZFFVKJpadMpkJ8whLJ3SvSsBFyZgCC/WnXH+85bpmnWRpaHEc/G7UbllnQtxE5H1zVE
 YcqiJpipa2FDAZUIBRpDMXxXE0PMAA
X-Received: by 2002:a05:6102:3ca6:b0:7cc:2086:34e0 with SMTP id
 ada2fe7eead31-7d03a1faee0mr2882897137.4.1793281631272; 
 Thu, 29 Oct 2026 06:47:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3ca6:b0:7cc:2086:34e0 with SMTP id
 ada2fe7eead31-7d03a1faee0mr2882865137.4.1793281630591; 
 Thu, 29 Oct 2026 06:47:10 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-179-7-133.red.bezeqint.net.
 [79.179.7.133]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3dcbsm33431146f8f.14.2026.10.29.06.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 06:47:09 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
To: Hongfu Li <hongfu.li@linux.dev>, Hongfu Li <lihongfu@kylinos.cn>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, kees@kernel.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: Re: [PATCH] drm/i915/userptr: Convert page APIs to folio equivalents
 in put_pages
Date: Thu, 29 Oct 2026 09:46:05 -0400
Message-Id: <20261029134605.882933-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260723064651.4100-1-hongfu.li@linux.dev>
References: <20260723064651.4100-1-hongfu.li@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX5pALQpLP72Eu
 jOAD+j430z55mm+X9Gt6nRNSK36BxmKF5w6eL8tIinLkBNcR5yyb4J3ahOcjt6IZdwRQC42j7WD
 gDlbgvW85OFs7NM6d380dWNOLLHB2RlcmqyIEswUhIdq5hzU4gWtDGFgov12wHb7uB3PCEEnjs3
 XjGIJDiNsD7MZVrAh9z+wC7cQRBKNkupBIET6HVfyrkcurIsMH1O5cGmub3nb2EsYYDl98gHxG/
 onE3JJxubJ+vwh4DEcOMZHMksfT3EXxo5sHJeZnEgO9lyrcJ+fSVbNpHUZwZqApt/7Y7Wae+gnq
 /3VUxgcmaOYZZ1e1ZaCkHW30/cUWvrotlP3OUXmY5kTDHVNYb8oreNmiF9CvFWA8IxMWy/fIxzf
 mgHiEIqYyxYVQEckzCPp8wYT9lwXvxQdu71xtxXcGxnmNoS4SndN4CT1hQKW+SdVc9WbpAOX00f
 MqGcnWSgF5iYhZ7UIcQ==
X-Proofpoint-ORIG-GUID: 2RJqsu3czJyA8cX3ChBqtyT7CfPZz44b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX/B0LoYWNpOMJ
 RW0k2Wjh8NP8nsToPCw6kfugRdrabHG8LG8bhKP1oonWVM9PtgRn8QJAt6fJ25RoGXV/ONsC/4G
 e+BLvetdGgi//qeURcp2ydX0CZyndnIr53o9PfKSe3Ze+jgIXwwY
X-Proofpoint-GUID: 2RJqsu3czJyA8cX3ChBqtyT7CfPZz44b
X-Authority-Analysis: v=2.4 cv=FY+iV5+6 c=1 sm=1 tr=0 ts=6ae34e5f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=bg3mo46-JBcyr3_gL6MA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=10 suspectscore=0 priorityscore=1501 impostorscore=10
 spamscore=0 adultscore=0 clxscore=1011 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:45 +0000
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Jul 23, 2026 at 02:46:51PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> Cache the folio with page_folio() at the start of the sg_table loop,
> then use folio helpers directly to eliminate repeated compound_head()
> lookups inside page API wrappers.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Hi,

Is there any update on picking this up? It would be great to get this
in, as it removes the last user of trylock_page() in the tree.

Thanks,
Tal
