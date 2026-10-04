Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E8CA6003
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB2A10EEEC;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MdYP6UcO";
	dkim-atps=neutral
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1020A10E538
 for <intel-gfx@lists.freedesktop.org>; Sun,  4 Oct 2026 09:49:05 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-35120d43ecaso842276eec.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 04 Oct 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791107344; x=1791712144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0mb/xR5eRFy3O59ezfi15bus74aOTFozmcjdhnt60XY=;
 b=MdYP6UcOVx7+ELipUh+6YlkBZzSjrp8iiY0AkzbrYk2F+APGIz7GDVbjxx8CQaYMSp
 25CYPDdWbDf3CN+Il2lTewYSEdufLSYQ5DgP9/1H64Gm45NJC18OXG+4S7UMN0x91Avd
 SgzzcWlmXxBF61fR6bSA/J6vM98QEsWsj/b/1EX7BKINdOwNlw05azKLsAMSUDvAgviZ
 v0oaBUB7Gr27Nde3xA80XUJDiNkMJNfp8/j7u0PrVCpvalc8CIa4eDWema2Vwgcgsr6O
 pVZKjOJQ7gfKsQ10Sr8mrPnQ+MGIJNrZIr0Gq12RnM/K0Nkpghx9RbWKf6CT3y6Mkubr
 UeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791107344; x=1791712144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0mb/xR5eRFy3O59ezfi15bus74aOTFozmcjdhnt60XY=;
 b=d7pq6vv+TSzCe6GkyeyQfmoiMulWgxpS1QWeK2Ewm+yBwjrhtDqdnQj5Ysfxq5AupE
 BXEHzgBoLq+L94vktqMqagP1r8/Dj6/R+aPBTXN7sG44vrhQw14+LSernGJvTXDfaqoc
 uzSXQNWLUIosox7ldEEC9sVr5jTQ5cswMHBbxLedI26nB1xC9vkLYX0AV0UPX4HxPdoa
 tMMj8FCfCu4TcjCq4oW0YDWUc9LgE3Z0H0YUXqJjhAy9Q5OnN7afO2eMBU/SpnXlYV6b
 72UFAJD8C/oCL54FnEBLqNabf1dqTN6YiyyqxDxA1hgdsosAtgJSFAOdXmfBCdO1boGa
 QzxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByp/pCZgNOABSjtM253CjTKb2RzlQOllUcnd3EM0mYlz9MZZpIXD0pnO1pWSig2lyChTyjVQcVd/zg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lhISobMbUA1iGrlDSWEy0vG4bF3ycnRGh+GP8MEYiW2bcBzthL
 YI+61GbOYiRdpBhICWpRMZgOgbuIg64ILhUIUftSLiFSog4i62Gj2R+uCQBdKKnLsm/GEA==
X-Gm-Gg: AYBFou03eXwI/+vfexoziKuiARUXsc6/QniJwhHdlEP7J7W63Nq5V1AvPwgwmI2s0II
 Tc3PqLTub9+bNkgx7luQVi/vEP5CpyVsv2YwdcM2u/dtP8hr0H74Of3jsAEd+1jml1nLeAcOzri
 0c3a5Kt3w9bKbxHR8PG2HfjlXnQBY1D2ctWVESs2KUEEvcwzYGTQdZhCKCr8CGnSCLWlU6GTn45
 0GoOrVh8b8AB/IyHFTVmCLtoB9oJIXbwXXl1xFkrdRgsORDWZ5XuGwHYCYubACt2dAFDCvFfVL9
 GUeD6Ujmm+KVcd2HHFLfsbERchg6zM7wlpOGxd9UstfolO3NWBcLsG6mWk29EPsj4VrrQ2zttgz
 CB0sGgKKwYNcedgdMODG0biofW6xec5d3z4Rpx5inC4CugIt2XMQrCOeS2nu3vTrGW21yG9YZsr
 BmJIkZGP/mhNN5+gfSQx4/UpG2kXPczT1e+bCZVbZYlBK8bQjgCYXVIzDH2KZuZmRSjSuIc4ifT
 aSKG2gjbkikmCdgNzvHj95IakWle4Je7ec4nuQDqvvgdYgTmSbrKFecxd/RvkuzvN3dCKoeXZcW
 8l+pdk1EsZSSUBn85FPjXhZnEOGjkpu06J1a4834Gepm7h8+oKAhsLsIJCU=
X-Received: by 2002:a05:701b:4552:10b0:137:5b9d:cf87 with SMTP id
 a92af1059eb24-151be1472c2mr5904637c88.0.1791107343946; 
 Sun, 04 Oct 2026 02:49:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-151fc39a7d1sm11321647c88.3.2026.10.04.02.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 02:49:03 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: look up shmem folios by index for writeback
Date: Sun,  4 Oct 2026 17:49:00 +0800
Message-ID: <20261004094900.174818-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002091439.59C611F00899@smtp.kernel.org>
References: <20261002073107.2209644-1-matthias.goergens@gmail.com>
 <20261002091439.59C611F00899@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thanks, good catch.  v2 looks the folios up in batches with
filemap_get_folios() and calls cond_resched() between batches:
https://lore.kernel.org/all/20261004094827.174193-1-matthias.goergens@gmail.com/
